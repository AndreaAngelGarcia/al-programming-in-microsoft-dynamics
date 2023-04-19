tableextension 50502 salesheaderext extends "Sales Header"
{
    fields
    {
        field(50500; BotónFacturaDetallada; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Botón Andrea';
        }
        field(50501; prueba; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Botón prueba';
            Editable = true;
        }
    }

    var
        myInt: Integer;
}