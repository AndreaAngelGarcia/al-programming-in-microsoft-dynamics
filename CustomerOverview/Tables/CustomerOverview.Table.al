table 50111 VistaGeneralDelCliente
{
    DataClassification = CustomerContent;
    Caption = 'Customer Overview';

    fields
    {
        field(50110; NMovimiento; Integer)
        {
            Caption = 'Número de movimiento', Comment = 'Este es el número de movimientos';
            DataClassification = CustomerContent;
        }
        field(50111; NCliente; Code[20])
        {
            Caption = 'Número cliente', Comment = 'Este es el número de clientes';
            DataClassification = CustomerContent;
        }
        field(50112; NombreCliente; Text[50])
        {
            Caption = 'Nombre del cliente', Comment = 'Este es el nombre de clientes';
            DataClassification = CustomerContent;
        }
        field(50113; CodigoOrigen; Code[20])
        {
            Caption = 'Código de origen', Comment = 'Este es el código de origen';
            DataClassification = CustomerContent;
        }
        field(50114; Importe; Decimal)
        {
            Caption = 'Importe', Comment = 'Este es el importe';
            DataClassification = CustomerContent;
        }
        field(50115; LastRunDate; DateTime)
        {
            Caption = 'LastRunDate', Comment = 'Este es el LastRunDate';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; NMovimiento)
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