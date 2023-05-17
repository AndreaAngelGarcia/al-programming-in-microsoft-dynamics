pageextension 50521 HistoricoFacturasVenta extends "Posted Sales Invoice"
{
    layout
    {

    }

    actions
    {
        addafter("F&unctions")
        {
            action(ModifDescripcionTrabajo)
            {
                ApplicationArea = All;
                Caption = 'Modif. Desc. Trabajo Andrea';
                Visible = isVisible;
                Image = Edit;
                RunObject = Page DescripcionTrabajoAndrea;
                RunPageLink = "No." = FIELD("No.");

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesInvoiceHeader);
                    if SalesInvoiceHeader.FindSet() then
                        Page.Run(PAGE::DescripcionTrabajoAndrea);
                end;
            }
        }
    }

    trigger OnOpenPage()

    var
        SalesReceivables: Codeunit VisibilidadConfVentasCobrosAnd;
    begin
        isVisible := SalesReceivables.Visibility();
    end;

    var
        myInt: Integer;
        isVisible: Boolean;
}