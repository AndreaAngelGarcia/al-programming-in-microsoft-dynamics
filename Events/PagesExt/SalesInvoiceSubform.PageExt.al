pageextension 50501 SalesInvoiceAndrea extends "Sales Invoice Subform"
{
    layout
    {
        addbefore(Quantity)
        {
            field(Fecha; Rec.FechaDisponibilidad)
            {
                ApplicationArea = All;
                Caption = 'Fecha disponibilidad Andrea';
                Style = StandardAccent;
                StyleExpr = false;
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