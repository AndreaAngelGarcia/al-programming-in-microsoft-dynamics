pageextension 50500 EventsAndrea extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group("Andrea")
            {
                field(CampoAndrea1; Rec.FechaDisponibilidad)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha Disponibilidad Andrea';
                }

                field(CampoAndrea2; Rec.CantidadDisponible)
                {
                    ApplicationArea = All;
                    Caption = 'Cantidad disponible en pedidos';
                    Editable = false;
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