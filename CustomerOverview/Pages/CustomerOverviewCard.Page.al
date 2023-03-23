page 50118 CustomerOverviewCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VistaGeneralDelCliente;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(NMovimiento; Rec.NMovimiento)
                {
                    ApplicationArea = All;

                }
                field(NCliente; Rec.NCliente)
                {
                    ApplicationArea = All;

                }
                field(NombreCliente; Rec.NombreCliente)
                {
                    ApplicationArea = All;

                }
                field(CodigoOrigen; Rec.CodigoOrigen)
                {
                    ApplicationArea = All;

                }
                field(Importe; Rec.Importe)
                {
                    ApplicationArea = All;

                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}