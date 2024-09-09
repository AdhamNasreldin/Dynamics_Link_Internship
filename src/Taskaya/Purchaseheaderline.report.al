report 50102 "Vendor Purchases"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'vendors Table';
    RDLCLayout = './test1.rdl';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column("Vendor_No"; "Purchase Header"."Buy-from Vendor No.")
            { }
            column("Vendor_Name"; "Purchase Header"."Buy-from Vendor Name")
            { }
            column(VAT_Registration_No_; "Purchase Header"."VAT Registration No.") { }
            column("Vendor_Items"; "Purchase Header"."Invoice Discount Amount")
            { }
            trigger OnPreDataItem()
            begin
                "Purchase Header".SetCurrentKey("Buy-from Vendor No.");
            end;

            trigger OnAfterGetRecord()
            begin
                if lastVendor <> "Purchase Header"."Buy-from Vendor No." then begin
                    Vendor.Init();
                    Vendor.Validate("No.", "Purchase Header"."Buy-from Vendor No.");
                    Vendor.Insert();
                    lastVendor := Vendor."No.";
                end;
            end;
        }
        dataitem(Vendor; Vendor)
        {
            UseTemporary = true;
            column(No; "No.")
            { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Buy-from Vendor No." = field("No.");
                column(Invoices; trying(Vendor, "Purchase Header"))
                {

                }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Vendors & their purchases';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; 'Purchase Invoice Header')
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
        lastVendor: Code[20];

    /* local procedure VendorTotalpur(var paracheeso: Record "Purchase Header"; Vendor: code[20]) ReturnValue: Decimal
     var
         Index: Integer;
         counter: Integer;
     // last_year: Date;
     begin
         // last_year := CalcDate('<-1Y>', Today);
         //paracheeso.SetRange("Order Date", last_year, Today);
         paracheeso.Reset();
         paracheeso.SetFilter("Buy-from Vendor No.", Vendor);
         //paracheeso.SetFilter("Buy-from Vendor Name", "Purchase Header"."Buy-from Vendor Name");
         // Index := paracheeso.Count;
         for Index := 0 to paracheeso.Count do begin
             counter += paracheeso."Amount Including VAT";
             ReturnValue := counter;
         end;
         paracheeso.Reset();

     end;*/

    local procedure trying(vendor: record Vendor; purchase: record "Purchase Header") ReturnValue: code[500]
    var
        index: Integer;
    begin
        purchase.Reset();
        purchase.SetFilter("Buy-from Vendor No.", vendor."No.");
        if purchase.FindSet() then
            repeat
                ReturnValue := ReturnValue + vendor."No.";
                ReturnValue := ReturnValue + ' , ';
            until purchase.Next() = 0;


        for index := 0 to purchase.Count do begin
            ReturnValue := ReturnValue + vendor."No.";
            ReturnValue := ReturnValue + ' , ';
        end;
        purchase.Reset();

    end;

    /* local procedure ay_kalam(var paracheeso: Record "Purchase Header"; var parchoos: Record "Purchase Line"; var vendors: Record Vendor) ReturnValue: array[50] of code[20]
     var
         Index: Integer;
         // karam: array[50] of text[20];
         Vandoory: code[20];
         invoicty: code[35];
         // dasf: Date;
         dict1: Dictionary of [code[20], Integer];
     begin
         // dasf := CalcDate('<-1Y>', Today);
         // paracheeso.SetRange("Order Date", dasf, Today);
         for index := 0 to paracheeso.Count do begin
             Vandoory := paracheeso."Buy-from Vendor No.";
             invoicty := paracheeso."Vendor Invoice No.";
             //dict1.add( , ) 

             //    karam[index] := parchoos.;
             ;
             index += 1;
         end;
     end;
     */
}