report 50501 InvoiceSales
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RDLC;

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

            column(Direccion; "Bill-to Address")
            {

            }

            column(Ciudad; "Bill-to City")
            {

            }

            column(CodigoPostal; "Bill-to Post Code")
            {

            }

            // MÉTODO DE PAGO Y VENCIMIENTOS
            column(MetodoPago; "Payment Method Code")
            {

            }

            column(Vencimientos; "Due Date")
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Bill-to Customer No." = field("Bill-to Customer No.");
                column(CódigoProducto; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Amount; Amount)
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Importe; "Line Amount")
                {

                }
                column(BaseImponible; "VAT Base Amount")
                {

                }

                column(Cuota; "Amount Including VAT" - "VAT Base Amount")
                {

                }

                column(VAT__; "VAT %")
                {

                }

                column(Amount_Including_VAT; "Amount Including VAT")
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
        layout(RDLC)
        {
            Type = RDLC;
            LayoutFile = 'Rdl/SalesInvoice.rdl';
        }
    }


    var
        myInt: Integer;
}