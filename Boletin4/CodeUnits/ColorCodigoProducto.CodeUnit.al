/*codeunit 50522 ColorCodigoProducto
{
    procedure CambioColorCodigoProducto(var ClientesHabituales: Record ClientesHabitualesAndrea; var SalesHeader: Record "Sales Header";
        var SalesLine: Record "Sales Line")
    begin
        SalesHeader.Get(SalesHeader."Document Type");
        SalesLine.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.");

        // Buscamos si el cliente es habitual
        ClientesHabituales.SetRange(CodigoCliente, SalesHeader."Bill-to Customer No.");
        ClientesHabituales.SetRange(CodigoProducto, SalesLine."No.");

        if not ClientesHabituales.FindFirst() then begin
            // Si no es habitual, cambiar el color del campo a rojo
            StyleExprTxt := 'Unfavorable';
            Rec.ClienteHabitual := false;
        end else begin
            // Si es habitual, comprobar si la fecha de Posting Date está entre las fechas creadas
            if (ClientesHabituales.FechaDesde = 0D) or
            ((ClientesHabituales.FechaDesde <= SalesHeader."Posting Date") and (SalesHeader."Posting Date" <= ClientesHabituales.FechaHasta)) then begin
                // Si está entre las fechas, no cambia el color del campo 
                StyleExprTxt := '';
                Rec.ClienteHabitual := true;
            end else begin
                // Si no está entre las fechas, cambia el color del campo a rojo
                StyleExprTxt := 'Unfavorable';
                Rec.ClienteHabitual := false;
            end;
        end;
    end;
}*/
