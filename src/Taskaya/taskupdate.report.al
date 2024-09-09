report 50107 "Purchased Item Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'vendor items';
    DefaultLayout = RDLC;
    RDLCLayout = './tst13.rdl';


    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(Vendor_No; "Buy-from Vendor No.") { }
            column(Document_No_; "Document No.") { }
            column("Item_code"; "No.") { }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = field("No.");
                column(Description; Description) { }
            }
            column(Quantity; Quantity) { }
            column(Type; parachoos_line.Type) { }
            trigger OnAfterGetRecord()
            begin
                //  parachoos_line.SetRange("Buy-from Vendor No.", "Purchase Line"."Buy-from Vendor No.");
                //another try

                //another replacment for the below condition 
                // if "Purchase Line".IsEmpty then
                //     CurrReport.Skip()
                // else if "Purchase Line".Type <> Type::Item then
                //     CurrReport.Skip();

                "Purchase Line".SetFilter("Buy-from Vendor No.", "Purchase Line"."Buy-from Vendor No.");
                if "Purchase Line".IsEmpty THEN
                    CurrReport.Skip();
                //  else if "Purchase Line"."Buy-from Vendor No." =previous_vendor then 

            end;

        }

    }

    requestpage
    {
        AboutTitle = 'Vendors Items';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Vendor_No; "Purchase Line"."No.")
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
        parachoos_line: Record "Purchase Line";
        previous_vendor: code[20];

}