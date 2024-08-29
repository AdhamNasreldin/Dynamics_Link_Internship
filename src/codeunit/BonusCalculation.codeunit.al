codeunit 50100 "DL Bonus calculation"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        bonusHeader: Record "Bonus Header";
        bonusLine: Record DL_Bonus_Line_Type;
        bonusEntry: Record "DL Bonus Entry";


    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        bonusHeader.Reset();
        bonusHeader.SetRange("Customer No", SalesInvLine."Bill-to Customer No.");
        bonusHeader.SetRange(status, bonusHeader.status::Released);
        repeat
            if (SalesInvLine."Posting Date" > bonusHeader."starting date ") and (SalesInvLine."Posting Date" < bonusHeader."End Date")
            then
                if bonusLine.type = bonusLine.type::All_Items then
                    FindBonusForAllItems(bonusHeader, SalesInvLine);
            FindBonusForOneItem(bonusHeader, SalesInvLine);
        until bonusHeader.Next() = 0;

    end;

    local procedure FindBonusForAllItems(var BonusHeader: Record "Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record DL_Bonus_Line_Type;
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::All_Items);
        if BonusLine.FindFirst() then
            InsertBonusEntry(SalesInvLine, BonusLine);
    end;

    local procedure FindBonusForOneItem(var BonusHeader: Record "Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record DL_Bonus_Line_Type;
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::Item);
        BonusLine.SetRange("Item No.", SalesInvLine."No.");
        if BonusLine.FindFirst() then
            InsertBonusEntry(SalesInvLine, BonusLine);
    end;

    local procedure InsertBonusEntry(var SalesInvLine: Record "Sales Invoice Line"; bonusLine: Record DL_Bonus_Line_Type)
    var
        BonusEntry: Record "DL Bonus Entry";
    begin
        BonusEntry.Init();
        BonusEntry."Document No." := SalesInvLine."Document No.";
        BonusEntry."Bonus No." := bonusLine."Document No.";
        BonusEntry."Posting date" := SalesInvLine."Posting Date";
        BonusEntry."Bonus amount" := SalesInvLine.Amount * bonusLine."Bonus perc." / 100;
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry.Insert();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertBonusEntry(var SalesInvLine: Record "Sales Invoice Line"; var BonusEntry: Record "DL Bonus Entry")
    begin
    end;
}


