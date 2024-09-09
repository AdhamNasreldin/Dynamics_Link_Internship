report 50109 "vendors items"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'vendor items';
    RDLCLayout = './tst22.rdl';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Document_Type; "Document Type") { }
            column(Item_Code; "No.") { }
            column(Quantity; Quantity) { }
            column(Total_purchased_Quantity; gettotalquantity()) { }

            trigger OnAfterGetRecord()
            begin
                curritem := "Purchase Line"."No.";

            end;
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
                    field(Name; "Purchase Line"."Pay-to Vendor No.")
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
        //myInt: Integer;
        curritem: code[20];
        currvendor: code[20];
        purchaseline: Record "Purchase Line";


    local procedure gettotalquantity() return: Integer;
    begin
        purchaseline.SetFilter("No.", curritem);
        if purchaseline.FindSet() then
            repeat
                return += purchaseline.Quantity;
            until purchaseline.Next() = 0;
    end;
}