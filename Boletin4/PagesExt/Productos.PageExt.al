pageextension 50512 Productos extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(PricesandDiscounts)
        {
            action("Clientes Habituales")
            {
                ApplicationArea = All;
                Caption = 'Clientes Habituales Andrea';
                Image = CustomerGroup;

                trigger OnAction()
                begin
                    Page.Run(PAGE::PageClientesHabitualesAndrea);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
