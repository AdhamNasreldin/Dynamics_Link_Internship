table 50101 "DL Bonus Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Entry Table';



    fields
    //Entry no , bonus no , document no . item no , posting date , bonus amount 
    // all fields not editable 
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
            AutoIncrement = true;

        }
        field(2; "Bonus No."; code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Bonus Header";

        }
        field(3; "Document No."; code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Invoice Header";

        }
        field(4; "Item No."; code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = item;
        }
        field(5; "Posting date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Bonus amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(pk; "Entry No.")
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

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}