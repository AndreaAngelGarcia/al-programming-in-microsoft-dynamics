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
        Rec.SetRange("No.", Rec."No.");
        if Rec.Get(Rec."No.") then begin
            Rec."Work Description".CreateOutStream(outStr);
            outStr.WriteText('');
            Rec."Work Description".CreateOutStream(outStr);
            outStr.WriteText(NuevaDescripcionTrabajo);
            Rec.Modify(true);
        end;
        /*Rec."Work Description".CreateOutStream(outStr);
        outStr.WriteText(NuevaDescripcionTrabajo);
        Rec.Modify(true);*/
    end;

    /// <summary>
    /// Evento que al darle a aceptar modifique el campo de descripción de trabajo
    /// </summary>
    /*[EventSubscriber(ObjectType::Page, Page::"VentanaNuevaAndrea", 'OnAfterValidateEvent', 'NuevaDescripcionTrabajo', true, true)]

    local procedure MyProcedure(var Rec: Record "Sales Invoice Header")
    var

    begin

    end;*/

    /*[EventSubscriber(ObjectType::Page, Page::"VentanaNuevaAndrea", 'OnAfterValidateEvent', 'NuevaDescripcionTrabajo', true, true)]
    procedure MyProcedure(var Rec: Record "Sales Invoice Header")
    var
        NuevaDescripcionTrabajo: Text[200];
    begin
        ActualizarDescripcionTrabajo(Rec, NuevaDescripcionTrabajo);
    end;*/

    var
        myInt: Integer;

}