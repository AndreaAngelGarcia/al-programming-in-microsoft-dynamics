tableextension 50501 TableExtConfiguration extends "Sales & Receivables Setup"
{
    fields
    {
        field(50500; BotónFacturaDetallada; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Botón Andrea';
            InitValue = true;
        }
    }

    var
        myInt: Integer;
}