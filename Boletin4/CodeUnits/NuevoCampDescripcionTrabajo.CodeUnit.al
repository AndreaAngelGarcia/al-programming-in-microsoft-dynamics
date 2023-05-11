codeunit 50511 NuevoCampoDescripcionTrabajo
{
    Permissions = tabledata "Sales Invoice Header" = RIMD;

    trigger OnRun()
    begin

    end;

    procedure ActualizarDescripcionTrabajo(Rec: Record "Sales Invoice Header"; NuevaDescripcionTrabajo: Text[200])
    var
        outStr: OutStream;
    begin
        if Rec.Get(Rec."No.") then begin
            Rec."Work Description".CreateOutStream(outStr);
            outStr.WriteText(NuevaDescripcionTrabajo);
            Rec.Modify(true);
        end;
    end;

    var
        myInt: Integer;
}