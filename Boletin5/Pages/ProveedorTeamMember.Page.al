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
                    ToolTip = 'Especifica el el nombre del proveedor.';
                }
                field("No."; Rec."Cod. Comprador")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el código del comprador.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Especifica el DNI del proveedor.';
                }
            }
            group(DireccionContacto)
            {
                Caption = 'Dirección y contacto';
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica la dirección del proveedor.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el código de País o región';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica la población';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el código postal';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el email';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el número de teléfono';
                }
            }
            group(Facturacion)
            {
                Caption = 'Facturación';
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Especifica el tipo de operación del proveedor para vincular las transacciones realizadas para este proveedor con la cuenta de contabilidad general adecuada según la configuración de contabilización general.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica la especificación de IVA del cliente o proveedor involucrado para vincular las transacciones realizadas para este registro con la cuenta de contabilidad general adecuada según la configuración de contabilización del IVA.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el tipo de mercado del proveedor para vincular las transacciones comerciales realizadas para el proveedor con la cuenta adecuada en la contabilidad general.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica los términos de pago';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el código de forma de pago';
                }
            }
        }
    }

    actions
    {

    }
}








