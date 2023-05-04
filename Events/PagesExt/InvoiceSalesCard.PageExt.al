pageextension 50503 InvoiceSalesCard extends "Sales Invoice"
{

    layout
    {

    }

    actions
    {
        addafter("P&osting")
        {
            action(FacturaAndrea)
            {
                ApplicationArea = All;
                Caption = 'Factura Andrea';
                Image = Report2;
                Visible = isVisible;

                trigger OnAction()
                var
                    Header: Record "Sales Header";
                begin
                    Header.Reset();
                    CurrPage.SetSelectionFilter(Header);
                    Report.Run(Report::InvoiceSales, true, true, Header);
                end;
            }
        }
    }

    trigger OnOpenPage()

    var
        SalesReceivables: Codeunit SalesReceivablesCU;
    begin
        isVisible := SalesReceivables.Visibility();
    end;

    var
        myInt: Integer;
        isVisible: Boolean;
}