pageextension 50520 ConfVentasCobrosAnd extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            group(Visibility)
            {
                Caption = 'Visibilidad Descripción del trabajo Andrea';
                field(boton; Rec.DescripcionTrabajoAndrea)
                {
                    ApplicationArea = All;
                    Caption = 'Modificar campo Andrea';
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}