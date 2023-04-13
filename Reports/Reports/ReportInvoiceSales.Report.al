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
            column(FechaRegistro; Format("Posting Date", 0, '<Closing><Day,2>-<Month,2>-<Year>'))
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

            column(Vencimientos; Format("Due Date", 0, '<Closing><Day,2>-<Month,2>-<Year>'))
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Bill-to Customer No." = field("Bill-to Customer No.");
                column(CodigoProducto; "No.")
                {

                }
                column(Descripcion; Description)
                {

                }
                column(Cantidad; Quantity)
                {

                }
                column(Precio; "Unit Price")
                {

                }
                column(Descuento; "Line Discount %")
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

                column(IVA; "VAT %")
                {

                }

                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }
                column(Unit_Volume; "Unit Volume")
                {

                }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    QuantityValue: Decimal;
                begin
                    if Type.AsInteger() = 0 then
                        CurrReport.Skip();

                    QuantityValue := "Sales Line"."Line Discount %";
                    if QuantityValue = 0 then
                        "Sales Line"."Line Discount %" := 0 / 100;
                end;

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
        layout(word)
        {
            type = Word;
            LayoutFile = 'Rdl/SalesInvoice.docx';
        }
    }

    var
        myInt: Integer;
}