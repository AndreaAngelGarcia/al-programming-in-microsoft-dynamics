tableextension 50520 ConfVentasCobrosAnd extends "Sales & Receivables Setup"
{
    fields
    {
        field(50511; DescripcionTrabajoAndrea; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}