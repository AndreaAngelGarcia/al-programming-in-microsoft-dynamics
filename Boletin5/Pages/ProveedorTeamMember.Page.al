page 50530 PageProveedorTeamMember
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TablaProveedorTeamMember;
    Caption = 'Nuevo Proveedor';
    Permissions = tabledata TablaProveedorTeamMember = RIMD;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."Cod. Comprador")
                {
                    ApplicationArea = All;
                }
                field(NIF; Rec.NIF)
                {
                    ApplicationArea = All;
                }
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                }
            }

            group(DireccionContacto)
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
                    ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = All;
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
        /*area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Vendor: Record Vendor;
                    TeamMemberVendor: Record "TablaProveedorTeamMember";
                begin
                    TeamMemberVendor.Get(Rec.ID, Rec."Cod. Comprador");
                    TeamMemberVendor.SetRange("Cod. Comprador", Vendor."Purchaser Code");
                    Vendor.Init();
                    Vendor."Purchaser Code" := TeamMemberVendor."Cod. Comprador";
                    Vendor.Name := TeamMemberVendor.Name;
                    Vendor.Address := TeamMemberVendor.Address;
                    Vendor."Country/Region Code" := TeamMemberVendor."Country/Region Code";
                    Vendor.City := TeamMemberVendor.City;
                    Vendor."Post Code" := TeamMemberVendor."Post Code";
                    Vendor."Phone No." := TeamMemberVendor."Phone No.";

                    Vendor.Insert(true);
                    Message('No.: %1', TeamMemberVendor."Cod. Comprador");
                    Message('Name: %1', TeamMemberVendor.Name);
                    Message('Address: %1', TeamMemberVendor.Address);
                end;
            }
        }*/
    }

    trigger OnClosePage()
    var
        TeamMemberVendorRec: Record "TablaProveedorTeamMember";
        JobQueueEntriesAndrea: Codeunit CrearProveedorAndrea;
    begin
        TeamMemberVendorRec := Rec;
        JobQueueEntriesAndrea.CrearProveedor(TeamMemberVendorRec);
        Clear(Rec);
    end;
}














