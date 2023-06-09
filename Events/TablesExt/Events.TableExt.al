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
            CalcFormula = COUNT("Sales Line" WHERE("Document Type" = FILTER(Invoice),
                                                    FechaDisponibilidad = FILTER(<> 0D),
                                                    Quantity = FILTER(> 0),
                                                    "No." = FIELD("No.")));
        }
    }

    var
        myInt: Integer;
}