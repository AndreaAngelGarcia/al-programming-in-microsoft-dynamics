pageextension 50530 PageExtListaProveedores extends "Vendor List"
{
    layout
    {

    }

    actions
    {
        addbefore(Action5)
        {
            action(CrearNuevoProveedor)
            {
                ApplicationArea = All;
                Caption = 'Crear nuevo proveedor';
                Image = Vendor;
                /* RunObject = Page ;
                RunPageLink = ; */

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}