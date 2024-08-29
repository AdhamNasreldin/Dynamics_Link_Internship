page 50101 DL_Bonus_Card
{
    PageType = Document;
    Caption = 'Bonus Card';
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Bonus Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the bonus no.';
                    ApplicationArea = All;
                }
                field("Customer No"; Rec."Customer No")
                {
                    ToolTip = 'Specifies the value of the Custmer No field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the The status of the order field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("starting date "; Rec."starting date ")
                {
                    ToolTip = 'Specifies the value of the when did we start the task field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the when will the task end field.', Comment = '%';
                    ApplicationArea = All;
                }

            }
            part(Lines; "DL_Bonus_Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
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
