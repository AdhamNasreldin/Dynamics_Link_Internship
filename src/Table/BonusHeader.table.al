table 50102 "Bonus Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus';
    // DrillDownPageId = 50103 ;
    //LookupPageId = Dl_page_bonus;
    // DataPerCompany = true;
    DrillDownPageId = DL_Bonus_List_Page;
    LookupPageId = DL_Bonus_List_Page;

    fields
    {
        field(1; "No."; code[20])
        {
            //DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        field(2; "Customer No"; code[20])
        {

            //DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                TestStatus();
            end;

        }
        field(3; "starting date "; Date)
        {
            //DataClassification = ;
            Caption = ' when did we start the task';
            trigger OnValidate()
            begin
                //checkorder();
                TestStatus();
            end;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'when will the task end';
            trigger OnValidate()
            begin
                //checkorder();
                TestStatus();

            end;
        }
        field(5; status; Enum Bonus_Header_Status)
        {
            Caption = 'The status of the order';
            trigger OnValidate()
            begin
                if status = Rec.status::Released then
                    TestStatus();
            end;
        }
    }

    keys
    {
        key(pk; "No.")
        {
            Clustered = true;
        }

    }
    trigger
        OnDelete()
    begin
        TestStatus();
        Linesdeleting();
    end;
    /*
    local procedure checkorder()
    var
        container: Date;
        BonusHeader: Record "Bonus Header";
    begin

        BonusHeader.SetRange("Customer No", '01121212');
        if BonusHeader.FindSet() then
            repeat
                Message(BonusHeader."No.");
            until BonusHeader.Next() = 0;

            if BonusHeader.FindLast() then 
            Rec.TestStatus(); 



        // if BonusHeader."End Date" < BonusHeader."starting date " then
        //     container := BonusHeader."starting date ";
        // BonusHeader."starting date " := BonusHeader."End Date";
        // BonusHeader."End Date" := container;
    end ;
        */
    local procedure TestStatus()
    var
        IfReleasedErr: label 'This bonus was released at %1 ', Comment = ' %1 - end-date';
    begin
        if status = status::Released then
            Error(IfReleasedErr, "End Date");

    end;

    local procedure Linesdeleting()
    var
        Lines: Record DL_Bonus_Line_Type;
    begin
        Lines.SetRange("Document No.", "No.");
        Lines.DeleteAll();
    end;
}