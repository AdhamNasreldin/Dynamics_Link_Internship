pageextension 50101 DL_Customer_List extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("DL No. of Bonuses"; Rec.DL_Bonuses)
            {
                ApplicationArea = all;
                ToolTip = 'counts the number of bonuses for a certain customer ';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(navigation)
        {
            action(DL_Bonuses)
            {
                Caption = 'Bonuses';
                ToolTip = 'Open Bonuses Lists assigned to customer';
                ApplicationArea = all;
                Image = Discount;
                RunObject = page "DL_Bonus_List_Page";
                RunPageLink = "Customer No" = field("No.");
            }
        }

    }

    var
        myInt: Integer;
}