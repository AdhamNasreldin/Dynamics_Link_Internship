report 50104 "Dl Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bonus Overview Report';
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = './BHBD.rdl';

    dataset
    {
        dataitem("Bonus Header"; "Bonus Header")
        {
            RequestFilterFields = "Customer No", "No.";
            column(No_; "No.") { }
            column(Customer_No; "Customer No") { }
            column(starting_date_; "starting date ") { }
            column(End_Date; "End Date") { }

            dataitem("DL Bonus Entry"; "DL Bonus Entry")
            {
                RequestFilterFields = "Posting date";
                DataItemLink = "Bonus No." = field("No.");
                column(Document_No_; "Document No.") { }
                column(Item_No_; "Item No.") { }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; "Bonus Header"."Customer No")
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    var
        myInt: Integer;
}