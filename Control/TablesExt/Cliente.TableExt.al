tableextension 50350 ClienteExtensionAndrea extends Customer
{
    fields
    {
        field(50300; CodigoCoche; Code[20])
        {
            Caption = 'Código coche Andrea';
            TableRelation = CochesAndrea;

        }

        field(50301; DescripcionCoche; Text[50])
        {
            Caption = 'Descripcion coche Andrea';
        }
    }

    var
        myInt: Integer;
}