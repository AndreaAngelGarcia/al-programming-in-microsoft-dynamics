tableextension 50500 TableExtEventsAndrea extends Item
{
    fields
    {
        field(50500; FechaDisponibilidad; Date)
        {
            Caption = 'Fecha disponibilidad Andrea';
            DataClassification = ToBeClassified;
        }
        field(50501; CantidadDisponible; Integer)
        {
            Caption = 'Cantidad disponible en pedidos';
            AccessByPermission = TableData Item = I;
            FieldClass = FlowField;
            CalcFormula = COUNT("Sales Line" WHERE(FechaDisponibilidad = FILTER(<> 0D),
                                                    Quantity = FILTER(> 0),
                                                    "No." = FIELD("No."),
                                                    "Document Type" = FILTER(Page::"Sales Invoice")));
        }
    }

    var
        myInt: Integer;
}