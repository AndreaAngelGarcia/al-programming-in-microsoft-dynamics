table 50520 ClientesHabitualesAndrea
{
    Caption = 'Tabla Clientes Habituales Andrea';

    fields
    {
        field(50520; CodigoCliente; Code[20])
        {
            Caption = 'Cod. Cliente';
            TableRelation = Customer WHERE("No." = FIELD(CodigoCliente));
        }
        field(50521; "FechaDesde"; Date)
        {
            Caption = 'Fecha Desde';
        }
        field(50522; "FechaHasta"; Date)
        {
            Caption = 'Fecha hasta';
        }
        field(50523; CodigoProducto; Code[20])
        {
            Caption = 'Cod. producto';
            TableRelation = Item WHERE("No." = FIELD(CodigoProducto));
        }
    }

    keys
    {
        key(MyPKey; CodigoCliente, CodigoProducto)
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