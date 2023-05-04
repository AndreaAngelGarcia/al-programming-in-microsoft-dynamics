report 50500 InvoiceSales
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RDL;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            /* NÚMERO DOCUMENTO, FECHA REGISTRO Y DATOS DEL CLIENTE */
            column(NDoc; "No.")
            {

            }
            column(FechaRegistro; Format("Posting Date", 0, '<Closing><Day,2>-<Month,2>-<Year>')) //Formateo de fecha
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

            column(Vencimientos; Format("Due Date", 0, '<Closing><Day,2>-<Month,2>-<Year>')) // Formateo de fecha 
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.")
                {

                }
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
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>€';
                }
                column(Descuento; "Line Discount %" / 100)
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>%';
                }
                column(Importe; "Line Amount")
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>€';
                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(BaseImponible; "VAT Base Amount")
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>€';
                }
                column(Cuota; "Amount Including VAT" - "VAT Base Amount")
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>€';
                }
                column(IVA; "VAT %" / 100)
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>%';
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision, 1:1><standard format,0>€';
                }
                column(Unit_Volume; "Unit Volume")
                {

                }

                column(FechaDisponibilidad; Format(FechaDisponibilidad, 0, '<Closing><Day,2>-<Month,2>-<Year>'))
                {

                }

                dataitem("Customer Bank Account"; "Customer Bank Account")
                {
                    DataItemLinkReference = "Sales Line";
                    DataItemLink = "Customer No." = field("Sell-to Customer No.");
                    column(IBAN; IBAN)
                    {

                    }

                    trigger OnAfterGetRecord()
                    var
                        IBANLength: Integer;
                        RedactedIBAN: Code[34];
                        i: Integer;
                    begin
                        IBANLength := StrLen(IBAN);
                        RedactedIBAN := IBAN;
                        for i := 1 to IBANLength - 4 do begin
                            if (RedactedIBAN[i] >= '0') and (RedactedIBAN[i] <= '9') then begin
                                RedactedIBAN[i] := '*';
                            end;
                        end;
                        IBAN := RedactedIBAN;
                    end;
                }

                /* Si 'Type' es tipo 'Comment' se salta el registro */
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    QuantityValue: Decimal;
                begin
                    if Type.AsInteger() = 0 then
                        CurrReport.Skip();
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
        layout(RDL)
        {
            Type = RDLC;
            LayoutFile = 'Rdl/SalesInvoice.rdl';
        }
        layout(Word)
        {
            type = Word;
            LayoutFile = 'Rdl/SalesInvoice.docx';
        }
    }

    var
        myInt: Integer;
}