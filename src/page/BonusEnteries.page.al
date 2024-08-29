page 50103 "DL Bonus Entries Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    Caption = ' Bonus Entries';
    SourceTable = "DL Bonus Entry";
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posting date"; Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'it specifies when was the this bonus created';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It specifies the no of this item';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'it specifies the no of the inovoice having bonus';

                }
                field("Bonus No."; Rec."Bonus No.")
                {
                    ApplicationArea = All;
                    Caption = ' the amount of bonus ';

                }
                field("Bonus amount"; Rec."Bonus amount")
                {
                    ApplicationArea = All;
                    Caption = ' How much will this bonus be ';

                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' it specifies the no of the bonus';

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}