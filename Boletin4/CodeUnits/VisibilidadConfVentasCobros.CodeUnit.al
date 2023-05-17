codeunit 50520 VisibilidadConfVentasCobrosAnd
{
    trigger OnRun()
    begin

    end;

    procedure Visibility(): Boolean
    var
        TabExtSetup: Record "Sales & Receivables Setup";
    begin
        if TabExtSetup.Get() then begin // Obtenemos el registro de la tabla
            exit(TabExtSetup.DescripcionTrabajoAndrea);
        end;
    end;

    var
        myInt: Integer;
}