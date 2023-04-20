codeunit 50500 CodeUnitSalesReceivables
{
    trigger OnRun()
    begin

    end;

    procedure Visibility(): Boolean
    var
        TabExtSetup: Record "Sales & Receivables Setup";
    begin
        if TabExtSetup.Get() then begin // Obtenemos el registro de la tabla
            exit(TabExtSetup.BotónFacturaDetallada);
        end;
    end;

    var
        myInt: Integer;
}