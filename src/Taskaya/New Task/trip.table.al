table 50104 "DL trip"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Trip No."; Integer)
        {
            DataClassification = ToBeClassified;  
        }
        field (2;;)
    }
    
    keys
    {
        key(pk; "Trip No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}