report 50108 "Header-Line report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Header line report';
    DefaultLayout = RDLC;
    RDLCLayout = './tst9.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column("Item_code"; "No.") { }
                column(Quantity; Quantity) { }
                column(Document_No_; "Document No.") { }
                dataitem(Item; Item)
                {
                    DataItemLink = "No." = field("No.");
                    column(Description; Description) { }
                }
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
                    field(Name; "Purchase Header"."No.")
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
    //  "purchasee line" : Record "Purchase Line" ; 
}