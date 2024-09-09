report 50106 Reporty
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './tst4.rdl';
    Caption = 'Reporty Task';

    dataset
    {

        dataitem(Vendor; Vendor)
        {
            column(No; "No.") { IncludeCaption = true; }
            column(Name; Name) { IncludeCaption = true; }
            column(No_of_ongoing_Purchases; PurchaseHeadeeer.Count) { }

            // dataitem("Purchase Line"; "Purchase Line")
            // {
            //     DataItemLink = "Buy-from Vendor No." = field("No.");
            //     column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { IncludeCaption = true; }
            //     column(Document_No_; "Document No.") { IncludeCaption = true; }
            // }
            //column(Purchases ;) 
            column(purchases_Nos; parsing(Vendor)) { }

            column(CompanyInfoPic; CompanyInfo.Picture)
            { }
            trigger OnPreDataItem()
            begin
                PurchaseHeadeeer.Ascending;
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin

                PurchaseHeadeeer.SetRange("pay-to Vendor No.", Vendor."No.");
                if PurchaseHeadeeer.IsEmpty then
                    CurrReport.Skip();
                // PurchaseHeadeeer.Reset();
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
                    field("No."; Vendor."No.")
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
                action(print)
                {
                    ApplicationArea = All;
                    Caption = 'print';
                    Image = Print;
                    RunObject = report Reporty;
                    ToolTip = 'prints vendors deals of last month';

                }

            }
        }
    }

    var
        myInt: Integer;
        //  previousVendor: Record Vendor;
        //  prevpo: code[20];
        PurchaseHeadeeer: Record "Purchase Header";
        CompanyInfo: Record "Company Information";

    local procedure parsing(vendor: record Vendor) ReturnValue: code[500]
    begin
        if PurchaseHeadeeer.FindSet() then
            repeat
                ReturnValue += PurchaseHeadeeer."No." + ',';
            //  PurchaseHeadeeer.PrintRecords(true);
            until PurchaseHeadeeer.Next() = 0;
    end;
    //  previous_purchase : Record 
}