tableextension 50501 TableExtConfiguration extends "Sales & Receivables Setup"
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

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Rec.prueba then begin
                    Rec.prueba := true;
                end else begin
                    Rec.prueba := false;
                end;
                Commit();
            end;
        }
    }

    var
        myInt: Integer;
}