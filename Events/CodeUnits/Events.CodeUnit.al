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
        FoundRecord: Integer;
    begin
        if Rec.FechaDisponibilidad = 0D then
            Message(Format('El producto de Andrea' + Rec."No." + ' se ha creado sin fecha de disponibilidad'))
        else begin
            ItemCardPage.Reset();
            ItemCardPage.SetRange(ItemCardPage."No.", SalesInvoice."No.");
            if ItemCardPage.FindSet() then begin
                FoundRecord := ItemCardPage.Count();
            end;
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