codeunit 50500 CodeUnitEjemploAndrea
{
    trigger OnRun()
    begin

    end;

    procedure MensajitoTabla()
    var
        myInt: Integer;
    begin
        Message('Este es el trigger de la tabla');
    end;

    procedure MensajitoPagina()
    var
        myInt: Integer;
    begin
        Message('Este es el trigger de la página');
    end;

    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnAfterValidateCity', '', true, true)]
    local procedure OnAfterValidateCity(var Vendor: Record Vendor)
    begin
        Message('Esta es la captura del evento');
    end;

    var
        myInt: Integer;
}