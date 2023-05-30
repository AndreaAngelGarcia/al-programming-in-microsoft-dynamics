tableextension 50351 CocheSalesHeaderAndrea extends "Sales Header"
{
    fields
    {
        field(50351; CodigoCoche; Code[20])
        {
            Caption = 'Código coche Andrea';
            TableRelation = CochesAndrea;
        }
    }

    var
        myInt: Integer;
}