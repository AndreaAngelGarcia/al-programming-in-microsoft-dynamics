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
                    Report.Run(Report::InvoiceSales, true, true, Header);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()

    begin
        if (IntegerVar = 1) then
            isVisible := true
        else
            isVisible := false;
    end;

    var
        IntegerVar: Integer;
        myInt: Integer;
        isVisible: Boolean;
}