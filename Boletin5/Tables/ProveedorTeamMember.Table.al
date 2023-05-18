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
            Editable = true;
            DataClassification = ToBeClassified;
        }

        field(3; "No."; Code[20])
        {
            Caption = 'Nº';
            DataClassification = ToBeClassified;
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
            /*trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation();
            end;*/
        }

        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            /*trigger OnLookup()
            begin
                OnBeforeLookupCity(Rec, PostCode);

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");

                OnAfterLookupCity(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateCity(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);

                OnAfterValidateCity(Rec, xRec);
            end;*/
        }

        field(8; "Post Code"; Code[20])
        {
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.Reset();
                if Page.RunModal(Page::"Post Codes", PostCode) = Action::LookupOK then
                    "Post Code" := PostCode."Country/Region Code";
            end;

            /*trigger OnLookup()
            begin
                OnBeforeLookupPostCode(Rec, "Post Code");

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");

                OnAfterLookupPostCode(Rec, "Post Code");
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidatePostCode(Rec, "Post Code", CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);

                OnAfterValidatePostCode(Rec, xRec);
            end;*/
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

            /*trigger OnValidate()
            begin
                UpdatePaymentTermsId();
            end;*/
        }

        field(15; "Payment Method Code"; Code[10])
        {
            Caption = 'Cód. forma pago';
            TableRelation = "Payment Method";
        }

    }

    keys
    {
        key(PK; ID, "No.")
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

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupCity(var Vendor: Record Vendor; var PostCodeRec: Record "Post Code")
    begin
    end;

}

