table 50550 CochesAndrea
{
    fields
    {
        field(50350; Codigo; Code[20])
        {
            Editable = true;
        }

        field(50351; Descripcion; Text[50])
        {
            Editable = true;
        }
    }

    keys
    {
        key(Key1; Codigo)
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