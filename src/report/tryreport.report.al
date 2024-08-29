report 50100 "DL bngarb"
{
    DefaultLayout = RDLC;
    RDLCLayout = './tst.rdl';

    dataset
    {
        dataitem("Purchase 3afreet"; "Purchase Line")
        {

            column("Document_NO"; "Purchase 3afreet"."Document No.")
            {
            }
            column(Vendor_No_; "Purchase 3afreet"."Pay-to Vendor No.")
            {
            }
            column("Price"; "Purchase 3afreet"."Unit Price (LCY)")
            {
            }
            column(Line_Amount; "Purchase 3afreet"."Line Amount")
            {
            }
        }
    }

}