page 50102 Dl_Bonus_Subform
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Lines';
    SourceTable = DL_Bonus_Line_Type;


    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Bonus perc."; Rec."Bonus perc.")
                {
                    ToolTip = 'Specifies the value of the Bonus perc. field.', Comment = '%';
                }
                field("type"; Rec."type")
                {
                    ToolTip = 'Specifies the value of the type field.', Comment = '%';
                }
            }
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