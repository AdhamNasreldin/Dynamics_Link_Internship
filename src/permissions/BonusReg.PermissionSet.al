permissionset 50100 DL_MyPermissionSet
{
    Assignable = true;
    Caption = 'DL_Bonus_Registeration';
    //IncludedPermissionSets = SomePermissionSet ;
    // satr ely fo2 da m3nah eh ???????????????     
    Permissions =
    tabledata "Bonus Header" = RMID,
    tabledata DL_Bonus_Line_Type = RMID,
    tabledata "DL Bonus Entry" = RMID;



    // Read , Modify , Insert , Delete ... 
    /* hl lw ana 5letha RMI da m3nah en ely et3mal can'tbe deleted */

}
