tableextension 50521 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50520; "ClienteHabitual"; Boolean)
        {
            Caption = 'Es cliente habitual';
        }
    }

    var
        myInt: Integer;
}