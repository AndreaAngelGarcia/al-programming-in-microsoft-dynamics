tableextension 50500 TableExtEventsAndrea extends Item
{
    fields
    {
        field(50500; FechaDisponibilidad; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha disponibilidad Andrea';
        }
        field(50501; CantidadDisponible; Integer)
        {
            Caption = 'Cantidad disponible en pedidos';
            /*AccessByPermission = TableData Item = I;
            FieldClass = FlowField;
            CalcFormula = COUNT(
                "Sales Line" WHERE(Quantity = FIELD("Quantity") <> 0,
                    "Document Type" = FIELD("Document Type"), SalesLine."Document Type"::Quote AND 
                    SalesLine."Status" = SalesLine."Status"::Pending AND 
                    SalesLine."Posting Date" <= TODAY AND 
                    SalesLine."Quantity" <> 0 AND 
                    SalesLine."Expected Receipt Date" <> 0 AND 
                    SalesLine."Expected Receipt Date" >= TODAY
                )
            );*/
        }
    }

    var
        myInt: Integer;
}