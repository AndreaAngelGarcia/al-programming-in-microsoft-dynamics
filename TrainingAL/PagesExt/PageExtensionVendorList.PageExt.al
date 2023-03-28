pageextension 50500 PageExtensionVendorList extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {
            field(Camp1; Rec.Camp1)
            {
                ApplicationArea = All;
            }
        }
        addbefore(Contact)
        {
            field(Camp2; Rec.Camp2)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("Request Approval")
        {
            action(NewAction)
            {
                ApplicationArea = All;
                Caption = 'Acción nueva';

                trigger OnAction()
                begin
                    Message('Esto es una accion nueva');
                end;
            }
        }
        addfirst("&Purchases")
        {
            action(ListaAndrea)
            {
                Caption = 'Lista Andrea';
                ApplicationArea = All;
                RunObject = report ReportAndrea;
            }
        }
        modify("Purchase Journal")
        {
            trigger OnAfterAction()
            var
                myInt: Integer;
            begin
                Message('Este es el trigger de la tabla');
            end;
        }
    }

    var
        myInt: Integer;
}