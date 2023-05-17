pageextension 50522 Productos extends "Item Card"
{
    layout
    {

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
                RunObject = Page ClientesHabitualesPageAnd;
                RunPageLink = CodigoProducto = FIELD("No.");

            }
        }
    }

    var
        myInt: Integer;
}