codeunit 50500 CodeUnitFechaDisponibilidadAnd
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Item", 'OnAfterValidateEvent', 'FechaDisponibilidad', true, true)]
    local procedure OnAfterValidateEvent(var Rec: Record Item)
    var
        ItemCardPage: Record Item;
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto ' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin

        end;
    end;

    var
        myInt: Integer;
}