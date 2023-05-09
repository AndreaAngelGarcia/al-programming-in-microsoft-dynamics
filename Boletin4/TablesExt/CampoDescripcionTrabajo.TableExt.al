tableextension 50511 CampoDescripcionTrabajo extends "Sales Invoice Header"
{
    fields
    {
        field(50510; NuevaDescripcion; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50511; NuevaDescripcion2; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
    }

    var
        myInt: Integer;
}