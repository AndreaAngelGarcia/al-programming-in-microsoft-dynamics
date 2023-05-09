page 50510 VentanaNuevaAndrea
{
    Caption = 'Cambia la descripcion de trabajo';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = StandardDialog;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(Content)
        {
            field(Descripcion; Rec."Work Description")
            {
                Caption = 'Descripción del trabajo actual';
                ApplicationArea = All;
                Editable = false;
            }
            field(DescripcionNueva; Rec."Work Description")
            {
                Caption = 'Descripción del trabajo actual';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}