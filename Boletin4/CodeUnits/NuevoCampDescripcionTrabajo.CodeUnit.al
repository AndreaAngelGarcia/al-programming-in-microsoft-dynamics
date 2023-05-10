codeunit 50511 NuevoCampoDescripcionTrabajo
{
    Permissions = tabledata "Sales Invoice Header" = RIMD;

    trigger OnRun()
    begin

    end;

    /// <summary>
    /// Evento que al darle a aceptar modifique el campo de descripción de trabajo
    /// </summary>
    [EventSubscriber(ObjectType::Page, Page::"VentanaNuevaAndrea", 'OnAfterValidateEvent', 'NuevaDescripcionTrabajo', true, true)]
    local procedure MyProcedure(var Rec: Record "Sales Invoice Header")
    var
        VentanaNueva: Page VentanaNuevaAndrea;
        OutStr: OutStream;
        InStr: InStream;
    begin
        Rec.Reset;
        Rec.CalcFields("Work Description");
        Rec.Setrange("No.", Rec."No.");
        if Rec.FindFirst() then begin

            Rec."Work Description".CreateInStream(InStr, TextEncoding::UTF8);
            //Rec."Work Description".CreateOutStream(OutStr);
            InStr.ReadText(NuevaDescripcionTrabajo);
            Rec."Work Description".CreateOutStream(OutStr);
            Rec.modify(true);
            Message('Descripción del trabajo actualizada.');
        end else
            Message('No se encontró la factura especificada.');
    end;

    var
        myInt: Integer;
        NuevaDescripcionTrabajo: Text[200];

}