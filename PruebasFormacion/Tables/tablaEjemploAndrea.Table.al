table 50110 "PTE tablaEjemploAndrea"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50100; Camp1; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }
        field(50101; Camp2; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Relación cliente';
            TableRelation = Customer where("Country/Region Code" = CONST('ES'));
        }
        field(50102; Camp3; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; Camp4; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                texto: Text;
                numero1, numero2, numero3 : Integer;
            begin
                texto := 'Hola';
                numero1 := 15;
                camp3 := texto + ' ' + Format(numero1);
            end;
        }
        field(50104; Camp5; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Camp1)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        textoGlobal: Label 'Esto es un texto global';

    trigger OnInsert()
    var
        texto: Text;
    begin
        texto := 'Es un valor del trigger Insert de la tabla';
        Camp5 := texto + textoGlobal;
    end;

    trigger OnModify()
    var
        texto: Text;
    begin
        texto := 'Modify - Es un valor del trigger Insert de la tabla';
        Camp5 := texto + textoGlobal;
    end;

    local procedure ProcedimientoLocal()
    var
        myInt: Integer;
    begin
        // lógica del procedimiento
        myInt := ProcedimientoGlobal();
    end;

    procedure ProcedimientoGlobal(): Integer;
    var
        myInt: Integer;
    begin
        myInt := 9 + 4;
        exit(myInt);
    end;
}
