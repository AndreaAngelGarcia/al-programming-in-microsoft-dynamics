tableextension 50501 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50500; FechaDisponibilidad; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha disponibilidad Andrea';
        }
    }

    var
        myInt: Integer;
}