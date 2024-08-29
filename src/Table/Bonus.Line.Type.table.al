table 50100 DL_Bonus_Line_Type
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Bonus Header";
        }

        field(2; type; Enum BonusLineType)
        {
            Caption = ' type ';
        }
        field(3; "Item No."; code[20])
        {
            Caption = 'Item No. ';
        }
        field(4; "Bonus perc."; Integer)
        {
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(pk; "Document No.", Type, "Item No.")
        {
            Clustered = true;

        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        TestStatus();
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    trigger OnDelete()
    begin
        TestStatus();
    end;

    trigger OnRename()
    begin
        TestStatus();
    end;

    local procedure TestStatus()
    var
        err: label 'This bonus was released you can''t edit it';
        BonusHeader: Record "Bonus Header";
    // error2 : label "This bonus was released you can't edit it" ;  // to be asked on 
    begin
        BonusHeader.Get(Rec."Document No.");
        if BonusHeader.status = BonusHeader.status::Released then
            Error(err);
    end;

}