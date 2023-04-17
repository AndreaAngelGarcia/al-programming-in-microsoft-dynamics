pageextension 50503 PaymentApplication extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            group(Visibility)
            {
                field(BotónFacturaDetallada; Rec.BotónFacturaDetallada)
                {
                    ApplicationArea = All;
                    Caption = 'Botón Andrea';
                }
            }

        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}