pageextension 50503 InvoiceSales extends "Sales Invoice List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Reports)
        {
            action(FacturaAndrea)
            {
                ApplicationArea = All;
                Caption = 'Factura Andrea';
                Image = Report2;

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

    var
        myInt: Integer;
}