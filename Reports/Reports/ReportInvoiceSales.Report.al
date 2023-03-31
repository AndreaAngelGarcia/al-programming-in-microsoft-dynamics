report 50501 InvoiceSales
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(NDoc; "No.")
            {

            }
            column(FechaRegistro; "Posting Date")
            {

            }

            column(NombreCliente; "Sell-to Customer Name")
            {

            }

            column(NumeroCliente; "Sell-to Customer No.")
            {

            }
            column(MetodoPago; "Shipment Method Code")
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Bill-to Customer No." = field("Bill-to Customer No.");
                column(CódigoProducto; "No.")
                {

                }
                column(Descripción; Description)
                {

                }
                column(Cantidad; Amount)
                {

                }
                column(Precio; "Unit Price")
                {

                }
                column(ImporteLinea; "Line Amount")
                {

                }

                column(BaseImponible; "VAT Base Amount")
                {

                }

                column(VAT__; "VAT %")
                {

                }

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'Rdl/SalesInvoice.rdl';
        }
    }


    var
        myInt: Integer;
}