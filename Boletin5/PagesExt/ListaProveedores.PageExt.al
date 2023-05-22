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

                trigger OnAction()
                var
                    TeamMember: Record TablaProveedorTeamMember;
                begin
                    TeamMember.Init();
                    Page.Run(PAGE::PageProveedorTeamMember);
                end;
            }
        }
    }

    var
        myInt: Integer;
}



