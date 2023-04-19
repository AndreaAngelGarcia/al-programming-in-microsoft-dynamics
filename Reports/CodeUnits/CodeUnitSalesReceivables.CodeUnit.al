codeunit 50500 CodeUnitSalesReceivables
{
    trigger OnRun()
    begin

    end;

    procedure Visibility(): Boolean
    var
        TabExtSetup: Record "Sales & Receivables Setup";
        valorprueba: Boolean;
    begin
        if TabExtSetup.Get() then begin // Obtenemos el registro de la tabla
            valorprueba := TabExtSetup.prueba;
            exit(TabExtSetup.BotónFacturaDetallada); // Almacenamos el valor del campo booleano en la variable global
        end;
    end;

    var
        myInt: Integer;
}