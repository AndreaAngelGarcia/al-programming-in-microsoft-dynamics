pageextension 50500 InvoiceSales extends "Sales Invoice List"
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
                Visible = isVisible;  //Ponemos que sea Visible según la variable global

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
        TabExtSetup: Record "Sales & Receivables Setup";
    begin
        if (TabExtSetup.Get()) then // Obtenemos el registro de la tabla
            isVisible := TabExtSetup.BotónFacturaDetallada; // Almacenamos el valor del campo booleano en la variable global
    end;

    var
        myInt: Integer;
        isVisible: Boolean;
}