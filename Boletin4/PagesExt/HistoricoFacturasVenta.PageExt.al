pageextension 50511 HistoricoFacturasVenta extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
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
                RunObject = Page VentanaNuevaAndrea;
                RunPageLink = "No." = FIELD("No.");

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    VentanaNuevaAndrea: Page VentanaNuevaAndrea;
                begin
                    SalesInvoiceHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesInvoiceHeader);
                    Page.Run(PAGE::VentanaNuevaAndrea);
                end;
            }
        }
    }

    trigger OnOpenPage()

    var
        SalesReceivables: Codeunit VisibilidadConfVentasCobros;
    begin
        isVisible := SalesReceivables.Visibility();
    end;

    var
        myInt: Integer;
        isVisible: Boolean;
}