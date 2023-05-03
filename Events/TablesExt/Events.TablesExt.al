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
            AccessByPermission = TableData Item = I;
            FieldClass = FlowField;
            CalcFormula = Count(Item);
        }
    }

    var
        myInt: Integer;
}