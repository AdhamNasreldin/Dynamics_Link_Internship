tableextension 50100 Dl_Customer extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; DL_Bonuses; Integer)
        {
            Caption = 'DL_Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("Bonus Header" where("Customer No" = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;


    var
        AtLeastOneBonusForCustomerExistsErr: Label 'At least one bonus for customer %1 exists.', Comment = '%1 - customer name';

    local procedure TestIfBonusExists()

    var
        BonusHeader: Record "Bonus Header";
    begin
        BonusHeader.SetRange("Customer No", Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(AtLeastOneBonusForCustomerExistsErr, Rec.Name);
    end;

}

