tableextension 50301 NombreProvMovs extends "Job Queue Entry"
{
    fields
    {
        field(50300; NombreProveedor; Integer)
        {
            Caption = 'Nombre proveedor';
        }
    }

    var
        myInt: Integer;
}