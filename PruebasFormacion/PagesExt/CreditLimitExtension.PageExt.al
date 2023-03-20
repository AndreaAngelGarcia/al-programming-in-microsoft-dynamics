pageextension 50113 CreditLimitExtension extends "Customer Card"
{
    actions
    {
        addafter("F&unctions")
        {
            action("UpdateCreditLimit")
            {
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }

    }

    procedure CallUpdateCreditLimit()
    var
        NewCreditLimit: Decimal;
    begin
        // Código para llamar a la función UpdateCreditLimit
    end;
}

