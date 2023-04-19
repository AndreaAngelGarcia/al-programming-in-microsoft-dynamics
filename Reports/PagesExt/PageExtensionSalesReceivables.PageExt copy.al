pageextension 50503 SalesOrderext extends "Sales Order"
{
    Editable = true;

    layout
    {
        addfirst(General)
        {
            group(Visibility)
            {
                Caption = 'andrea';
                field(boton; Rec.BotónFacturaDetallada)
                {
                    ApplicationArea = All;
                    Caption = 'Botón Andrea';
                    Editable = true;
                }
            }

            field(prueba; Rec.prueba)
            {
                ApplicationArea = All;
                Caption = 'Botón prueba';
                Editable = true;


            }

        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}