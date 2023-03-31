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
            action(Prueba)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesLine: Record "Sales Header";
                begin
                    SalesLine.Reset();
                    CurrPage.SetSelectionFilter(SalesLine);
                    Report.Run(Report::InvoiceSales);
                end;
            }
        }
    }

    var
        myInt: Integer;
}