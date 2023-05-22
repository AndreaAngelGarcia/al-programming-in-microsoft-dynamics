table 50530 TablaProveedorTeamMember
{
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
        }

        //GENERAL
        field(2; Name; Text[100])
        {
            Caption = 'Nombre';
        }

        field(3; "Cod. Comprador"; Code[20])
        {
            Caption = 'Cód. Cliente';
            TableRelation = Vendor;
        }

        field(4; NIF; Text[100])
        {
            Caption = 'NIF/CIF';
        }

        //DIRECCIÓN Y CONTACTO
        field(5; Address; Text[100])
        {
            Caption = 'Dirección';
        }

        field(6; "Country/Region Code"; Code[10])
        {
            Caption = 'Cód. país/región';
            TableRelation = "Country/Region";
        }

        field(7; City; Text[30])
        {
            Caption = 'Población';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;

            // Rellenar el campo Post Code cuando se ponga ciudad
            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                if "Country/Region Code" = '' then
                    exit;
                PostCode.SetRange("Country/Region Code", "Country/Region Code");
                PostCode.SetRange(City, City);
                if PostCode.FindFirst() then
                    "Post Code" := PostCode.Code;
            end;
        }

        field(8; "Post Code"; Code[20])
        {
            Caption = 'Código postal';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.Reset();
                if Page.RunModal(Page::"Post Codes", PostCode) = Action::LookupOK then
                    "Post Code" := PostCode."Country/Region Code";
            end;

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                if "Country/Region Code" = '' then
                    exit;
                PostCode.SetRange("Country/Region Code", "Country/Region Code");
                PostCode.SetRange(Code, "Post Code");
                if PostCode.FindFirst() then
                    City := PostCode.City;
            end;
        }

        field(9; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if "E-Mail" = '' then
                    exit;
                MailManagement.CheckValidEmailAddresses("E-Mail");
            end;
        }

        field(10; "Phone No."; Text[30])
        {
            Caption = 'Nº teléfono';
        }

        //FACTURACIÓN
        field(11; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Grupo contable neg. gen.';
            TableRelation = "Gen. Business Posting Group";

            /*trigger OnValidate()
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;*/
        }

        field(12; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Grupo contable IVA negocio';
            TableRelation = "VAT Business Posting Group";
        }

        field(13; "Vendor Posting Group"; Code[20])
        {
            Caption = 'Grupo registro proveedor';
            TableRelation = "Vendor Posting Group";
        }

        field(14; "Payment Terms Code"; Code[10])
        {
            Caption = 'Cód. términos pago';
            TableRelation = "Payment Terms";
        }

        field(15; "Payment Method Code"; Code[10])
        {
            Caption = 'Cód. forma pago';
            TableRelation = "Payment Method";
        }

        field(16; "Processed"; Boolean)
        {
            Caption = 'Procesado';
        }
    }

    keys
    {
        key(PK; ID, "Cod. Comprador")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    /*procedure CreateVendor()
    var
        Vendor: Record Vendor;
    begin
        //Rec.Get(ID, "Cod. Comprador");
        Rec.SetRange("Cod. Comprador", Vendor."Purchaser Code");
        Vendor.Init();
        Vendor."Purchaser Code" := Rec."Cod. Comprador";
        Vendor.Name := Rec.Name;
        Vendor.Address := Rec.Address;
        Vendor."Country/Region Code" := Rec."Country/Region Code";
        Vendor.City := Rec.City;
        Vendor."Post Code" := Rec."Post Code";
        Vendor."Phone No." := Rec."Phone No.";

        Vendor.Insert(true);
        Message('No.: %1', Rec."Cod. Comprador");
        Message('Name: %1', Rec.Name);
        Message('Address: %1', Rec.Address);
    end;*/

    trigger OnInsert()

    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;
}

