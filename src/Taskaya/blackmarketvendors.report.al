report 50103 "Black Market Vendors"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Black_market_vendors';
    RDLCLayout = './tst99.rdl';


    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Document_Type; "Document Type") { }
            column(Item_Code; "No.") { }
            column(Quantity; Quantity) { }
            trigger OnAfterGetRecord()
            begin
                purchaseline.SetFilter("No.", "Purchase Line"."No.");
                if (isduplicate()) then
                    CurrReport.Skip();



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
        myInt: Integer;
        curritem: code[20];
        purchaseline: Record "Purchase Line";

    local procedure isduplicate() return: Boolean;
    begin
        if purchaseline.Count <> 1 then
            return := true;
        purchaseline.Reset();
    end;
}