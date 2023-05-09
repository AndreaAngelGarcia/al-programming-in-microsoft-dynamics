tableextension 50510 ConfVentasCobrosAnd extends "Sales & Receivables Setup"
{
    fields
    {
        //Prueba
        field(50510; ModDescripcionTrabajo; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50511; DescripcionTrabajoAnd; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}