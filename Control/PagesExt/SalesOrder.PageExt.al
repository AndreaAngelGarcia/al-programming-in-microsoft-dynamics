pageextension 50551 CocheSalesOrder extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            group(CochesAndrea)
            {
                Caption = 'Código coche Andrea';

                field(CodigoCoche; Rec.CodigoCoche)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {

    }

    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        //Customer.Get(SalesHeader."Document Type");
        //SalesHeader.Get(Customer."No.");
        Customer.SetRange("No.", SalesHeader."No.");
        SalesHeader.SetRange("Document Type", Customer."Contact Type");
        if Customer.FindFirst() then
            Message('El codigo de este cliente es:' + Customer."No.");
        Message('El codigo del coche de este cliente es:' + Customer.CodigoCoche);
        /*Rec.CodigoCoche := Customer.CodigoCoche;
        Rec.Insert();*/
    end;

    var
        myInt: Integer;
}