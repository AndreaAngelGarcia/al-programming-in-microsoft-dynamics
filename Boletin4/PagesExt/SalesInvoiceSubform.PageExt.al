pageextension 50523 SalesInvoiceSubform extends "Sales Invoice Subform"
{
    layout
    {
        // Modificamos el campo codigo para ponerlo rojo
        modify("No.")
        {
            StyleExpr = StyleExprColor;
        }

        // Añadimos el campo del cliente habitual
        addafter("Description")
        {
            field("Es Cliente Habitual"; Rec.ClienteHabitual)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        ClientesHabituales: Record ClientesHabitualesAndrea;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
        SalesLine.Get(Rec."Document Type", Rec."Document No.", Rec."Line No.");

        // Buscamos si el cliente es habitual
        ClientesHabituales.SetRange(CodigoCliente, SalesHeader."Bill-to Customer No.");
        ClientesHabituales.SetRange(CodigoProducto, SalesLine."No.");

        if not ClientesHabituales.FindFirst() then begin
            // Si no es habitual, cambiar el color del campo a rojo
            StyleExprColor := 'Unfavorable';
            Rec.ClienteHabitual := false;
        end else begin
            // Si es habitual, comprobar si la fecha de Posting Date está entre las fechas creadas
            if (ClientesHabituales.FechaDesde = 0D) or
            ((ClientesHabituales.FechaDesde <= SalesHeader."Posting Date") and (SalesHeader."Posting Date" <= ClientesHabituales.FechaHasta)) then begin
                // Si está entre las fechas, no cambia el color del campo 
                StyleExprColor := '';
                Rec.ClienteHabitual := true;
            end else begin
                // Si no está entre las fechas, cambia el color del campo a rojo
                StyleExprColor := 'Unfavorable';
                Rec.ClienteHabitual := false;
            end;
        end;
    end;

    var
        StyleExprColor: Text;
}