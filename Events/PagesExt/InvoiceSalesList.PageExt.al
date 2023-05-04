pageextension 50502 InvoiceSales extends "Sales Invoice List"
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
                Visible = isVisible;

                trigger OnAction()
                var
                    Header: Record "Sales Header";
                begin
                    Header.Reset();
                    CurrPage.SetSelectionFilter(Header);
                    if Header.FindSet() then
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