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
            TableRelation = "Salesperson/Purchaser";
        }

        field(4; "VAT Registration No."; Text[20])
        {
            Caption = 'CIF/NIF';

            /*trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateVATRegistrationNo(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;
                "VAT Registration No." := UpperCase("VAT Registration No.");
                if "VAT Registration No." <> xRec."VAT Registration No." then
                    VATRegistrationValidation();
            end;*/
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

        // BONUS 1: CONTACTO
        field(17; "Primary Contact No."; Code[20])
        {
            Caption = 'Código del contacto principal';
            TableRelation = "Contact Business Relation";

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
                TempVend: Record Vendor temporary;
            begin
                ContBusRel.SetCurrentKey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Vendor);
                ContBusRel.SetRange("No.", "Cod. Comprador");
                if ContBusRel.FindFirst() then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Primary Contact No." <> '' then
                    if Cont.Get("Primary Contact No.") then;
                if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
                    TempVend.Copy(Rec);
                    Find();
                    TransferFields(TempVend, false);
                    Validate("Primary Contact No.", Cont."No.");
                end;
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
                Contact := '';
                if "Primary Contact No." <> '' then begin
                    Cont.Get("Primary Contact No.");

                    ContBusRel.FindOrRestoreContactBusinessRelation(Cont, Rec, ContBusRel."Link to Table"::Vendor);

                    if Cont."Company No." <> ContBusRel."Contact No." then
                        Error('Error', Cont."No.", Cont.Name, "Cod. Comprador", Name);
                    //Text004
                    if Cont.Type = Cont.Type::Person then begin
                        Contact := Cont.Name;
                        exit;
                    end;

                    if Cont."Phone No." <> '' then
                        "Phone No." := Cont."Phone No.";
                    if Cont."E-Mail" <> '' then
                        "E-Mail" := Cont."E-Mail";
                end;
            end;
        }


        field(18; Contact; Text[100])
        {
            Caption = 'Contacto';

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                TempVend: Record Vendor temporary;
            begin
                if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Vendor, "Cod. Comprador") then
                    Cont.SetRange("Company No.", ContactBusinessRelation."Contact No.")
                else
                    Cont.SetRange("Company No.", '');

                if "Primary Contact No." <> '' then
                    if Cont.Get("Primary Contact No.") then;
                if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
                    TempVend.Copy(Rec);
                    Find();
                    TransferFields(TempVend, false);
                    Validate("Primary Contact No.", Cont."No.");
                end;
            end;

            trigger OnValidate()
            var
                RMSetup: Record "Marketing Setup";
                UpdateContFromVend: Codeunit "VendCont-Update";
                Vendor: Record Vendor;

            begin
                if RMSetup.Get() then
                    if RMSetup."Bus. Rel. Code for Vendors" <> '' then begin
                        if (xRec.Contact = '') and (xRec."Primary Contact No." = '') and (Contact <> '') then begin
                            Modify();
                            UpdateContFromVend.OnModify(Vendor);
                            UpdateContFromVend.InsertNewContactPerson(Vendor, false);
                            Modify(true);
                        end;
                        exit;
                    end;
            end;
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


