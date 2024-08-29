codeunit 50101 "DL Eng Khaled's task"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;


    local procedure GetCustomerNo(var customers: Record Customer) ReturnValue: Integer
    //  var customerno : Integer ;
    begin
        //customerNo := 0; 
        ReturnValue := customers.Count();

    end;

    local procedure ZeroBalanceCustomerNo(var customers: Record Customer) ReturnValue: Integer
    begin
        customers.Reset();
        //  customers.SetFilter(Balance,..%1,[0]) ;
        customers.SetRange(Balance, 0);
        //  customers.SetRange(customers.CalcAvailableCredit());
        ReturnValue := customers.Count();
    end;

    local procedure getcustomernoatlocation(location: code[10]) ReturnValue: Integer
    var
        customers: Record Customer;
    begin
        customers.SetFilter(customers."Location Code", location);
        ReturnValue := customers.Count();
    end;



    local procedure CalcTotalLocationBalance(location: code[10]) ReturnValue: Decimal
    var
        customers: Record Customer;
        CustomersNo: Integer;

    begin
        CustomersNo := getcustomernoatlocation(location);
        repeat
            ReturnValue += customers.Balance;
            CustomersNo -= 1;
        until CustomersNo = 0
    end;

}