pageextension 50530 PageExtListaProveedores extends "Vendor List"
{
    layout
    {

    }

    actions
    {
        addfirst(processing)
        {
            action(CrearNuevoProveedor)
            {
                ApplicationArea = All;
                Caption = 'Crear nuevo proveedor Andrea';
                Image = Add;
                RunObject = Page PageProveedorTeamMember;
                RunPageLink = "No." = FIELD("No.");

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}