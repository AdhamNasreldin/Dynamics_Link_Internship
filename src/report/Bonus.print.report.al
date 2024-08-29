report 50105 "DL Bonus printout"
{
    UsageCategory = None;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName; 

    dataset
    {
        dataitem("Bonus Header"; "Bonus Header")
        {
            RequestFilterFields = "Customer No", "No.";
            column(No_; "No.") { IncludeCaption = true; }
            column(Customer_No; "Customer No") { IncludeCaption = true; }
            column(starting_date_; "starting date ") { IncludeCaption = true; }
            column(End_Date; "End Date") { IncludeCaption = true; }

            dataitem(DL_Bonus_Line_Type; DL_Bonus_Line_Type)
            {
                DataItemLink = "Document No." = field("No.");
                column(type; type) { IncludeCaption = true; }
                column(Item_No_; "Item No.") { IncludeCaption = true; }
                column(Bonus_perc_; "Bonus perc.") { IncludeCaption = true; }
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
            area(Reporting)
            {
                action(print)
                {
                    ApplicationArea = All;
                    Caption = 'print';
                    Image = Print;
                    RunObject = report "DL Bonus printout";
                    ToolTip = 'prints bonus card';


                }
            }
        }
    }



    var
        myInt: Integer;
}