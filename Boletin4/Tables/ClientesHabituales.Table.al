table 50510 ClientesHabitualesAndrea
{
    Caption = 'Tabla Clientes Habituales Andrea';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Cod. Cliente';
            TableRelation = Customer;
        }
        field(2; "FechaDesde"; Date)
        {
            Caption = 'Fecha Desde';
            DataClassification = SystemMetadata;

            /*trigger OnValidate()
            begin
                /*if ("FechaDesde" > "FechaHasta") then begin
                    Message('La fecha no puede ser menor a Fecha Desde');
                end*//*
            if not ("FechaHasta" <> 0D) then begin
                    Message('La fecha: ' + 'hasta no puede estar vacía');
                end;
            end;*/
        }
        field(3; "FechaHasta"; Date)
        {
            Caption = 'Fecha hasta';
            DataClassification = SystemMetadata;

            trigger OnValidate()
            begin
                Validate(FechaDesde);
            end;
        }
        field(4; MyField; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; MyField)
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

    // FUNCION VALIDAR FECHA QUE DESDE Y HASTA ESTEN DENTRO DE FECHA REGISTRO
    local procedure ValidarFechas(): Boolean
    var
        FacturaVenta: Record "Sales Header";
    // llamo a la codeunit
    begin
        if (FacturaVenta."Posting Date" < Rec.FechaDesde) or (FacturaVenta."Posting Date" > Rec.FechaHasta) then
            Message('Hola caracola');
        // en la codeunit cambio de color
    end;
}