codeunit 50500 CodeUnitEvents
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Item", 'OnAfterValidateEvent', 'FechaDisponibilidad', true, true)]
    local procedure OnAfterValidateEvent(var Rec: Record Item)
    var
        ItemCardPage: Record Item;
        SalesInvoice: Record "Sales Line";
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto ' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin
            ItemCardPage.Reset();
            ItemCardPage.SetRange(ItemCardPage."No.", SalesInvoice."No.");
            if Rec.FechaDisponibilidad = SalesInvoice."Posting Date" then
                Message(Format(ItemCardPage.Count));
        end;
    end;

    var
        myInt: Integer;
}