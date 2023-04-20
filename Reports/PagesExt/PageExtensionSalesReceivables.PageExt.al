pageextension 50501 PaymentApplication extends "Sales & Receivables Setup"
{

    layout
    {
        addlast(General)
        {
            group(Visibility)
            {
                Caption = 'Visibilidad Andrea';
                field(boton; Rec.BotónFacturaDetallada)
                {
                    ApplicationArea = All;
                    Caption = 'Botón Andrea';
                    Editable = true;
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