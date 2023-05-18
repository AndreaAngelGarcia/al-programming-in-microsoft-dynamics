page 50530 PageProveedorTeamMember
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TablaProveedorTeamMember;
    Caption = 'Nuevo Proveedor';
    //RefreshOnActivate = true;
    //Editable = true;
    //Permissions = TableData TablaProveedorTeamMember = RMD;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(NIF; Rec.NIF)
                {
                    ApplicationArea = All;
                }
            }

            group(DirecciónContacto)
            {
                Caption = 'Dirección y contacto';
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
            }

            group(Facturacion)
            {
                Caption = 'Facturación';
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {

    }
}

