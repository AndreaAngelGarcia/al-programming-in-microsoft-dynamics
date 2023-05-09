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
                // AccessByPermission = TableData "Sales Invoice Header" = R;

                trigger OnValidate()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesInvoiceHeader);
                    SalesInvoiceHeader.FindSet();
                end;
            }
            field(NuevaDescripcion; NuevaDescripcionTrabajo)
            {
                Caption = 'Nueva descripción del trabajo2';
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
        NuevaDescripcionTrabajo: Text[200];
}