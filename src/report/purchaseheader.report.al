report 50101 "DL Purchase Header Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Purchase Header Report';

    RDLCLayout = './tst1.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column("Customer_No"; "Sell-to Customer No.")
            {

            }
            column("DocumentDate"; "Document Date")
            {
            }
            column(Document_Type; "Document Type")
            {

            }
            column("Purchase_Amount"; Amount)
            {

            }
            column(Customer_Name; "Pay-to Name")
            {

            }

        }
    }

    requestpage
    {
        AboutTitle = 'Purchases that we made lost month ';
        AboutText = 'This is a report about the purchases we''ve had in the last month ';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; "Purchase Header"."Pay-to Name")
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