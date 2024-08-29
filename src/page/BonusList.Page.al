page 50100 DL_Bonus_List_Page
{
    PageType = List;
    Caption = 'Bonuses';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Header";
    CardPageId = DL_Bonus_Card;


    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus no.';
                }
                field("Custmer No"; Rec."Customer No")
                {
                    ToolTip = 'Specifies the value of the Custmer No field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the The status of the order field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Open customer card for the bonus.';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No");
            }
            action("Bonus Entry")
            {
                ApplicationArea = All;
                caption = 'Bonus Entry';
                ToolTip = 'opens the bonus entry page';
                Image = Trace;
                RunObject = page "DL Bonus Entries Page";
                RunPageLink = "Bonus No." = field("No."); // satr da lazmto eh 
            }
        }
    }
}