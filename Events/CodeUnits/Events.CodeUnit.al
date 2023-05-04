codeunit 50500 CodeUnitEvents
{
    trigger OnRun()
    begin

    end;

    /// <summary>
    /// Evento que al crear un producto nuevo, si la fecha está vacía se muestra un mensaje
    /// diciendo que se ha creado sin fecha de disponibilidad.
    /// </summary>
    [EventSubscriber(ObjectType::Table, Database::"Item", 'OnAfterValidateEvent', 'FechaDisponibilidad', true, true)]
    local procedure OnAfterValidateEvent(var Rec: Record Item)
    var
        ItemCardPage: Record Item;
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto de Andrea' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin

        end;
    end;

    /// <summary>
    ///
    /// </summary>
    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnBeforeActionEvent', 'Post', true, true)]
    local procedure OnBeforeActionEvent()
    var
        ItemCardPage: Record Item;
    begin
        if ItemCardPage.FechaDisponibilidad = 0D then begin
            if not Confirm('¿Desea continuar sin poner una fecha de disponibilidad?') then
                exit;
        end;
    end;

    /*[EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnAfterGetRecordEvent', '', true, true)]
    local procedure MyProcedure(var Rec: Record Item)
    var
        ItemCardPage: Record Item;
        SalesInvoice: Record "Sales Line";
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto de Andrea' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin

        end;
    end;*/

    /*[EventSubscriber(ObjectType::Page, Page::"Item List", 'OnAfterGetCurrRecordEvent', '', true, true)]
    local procedure MyProcedure(var Rec: Record Item)
    var
        ItemCardPage: Record Item;
        SalesInvoice: Record "Sales Line";
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto de Andrea' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin

        end;
    end;*/

    var
        myInt: Integer;
}