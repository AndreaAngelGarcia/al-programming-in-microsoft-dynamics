pageextension 50501 PageExtensionVendorCard extends "Vendor Card"
{
    layout
    {
        addfirst(General)
        {
            field(Camp1; Rec.Camp1)
            {
                ApplicationArea = All;
            }
        }

        addlast(Invoicing)
        {
            field(Camp2; Rec.Camp2)
            {
                ApplicationArea = All;
            }
        }

        modify(Name)
        {
            trigger OnAfterValidate()
            var
                CU: Codeunit CodeUnitEjemploAndrea;
            begin
                CU.MensajitoPagina();
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}