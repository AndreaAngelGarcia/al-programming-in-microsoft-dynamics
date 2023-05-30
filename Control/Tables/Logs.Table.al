table 50551 LogsAndrea
{
    fields
    {
        field(50550; CodigoCoche; Code[20])
        {
            Caption = 'Código coche';
        }
        field(50551; NDocumento; Integer)
        {
            Caption = 'Número de documento';
        }
    }

    keys
    {
        key(Key1; CodigoCoche)
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