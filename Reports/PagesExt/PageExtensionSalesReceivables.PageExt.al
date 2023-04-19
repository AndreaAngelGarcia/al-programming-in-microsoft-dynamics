pageextension 50501 PaymentApplication extends "Sales & Receivables Setup"
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
    }

    actions
    {

    }

    var
        myInt: Integer;
}