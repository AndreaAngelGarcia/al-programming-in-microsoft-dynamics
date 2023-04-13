table 50501 StoreAndrea
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50500; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(50501; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }

        field(50502; PostingDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Posting Date';
        }

        field(50503; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = Item;
        }

        field(50504; VariantCode; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Variant Code';
            TableRelation = "Item Variant";
        }

        field(50505; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
            Editable = true;

            trigger OnValidate()
            var
                ItemNo: Record Item;
                VariantCode: Record "Item Variant";
            begin
                VariantCode.SetRange("Item No.", ItemNo."No.");
                VariantCode.get(ItemNo."No.");

                if VariantCode."Item No." <> '' then
                    Description := ItemNo.Description + ' - ' + VariantCode.Description
                else
                    Description := ItemNo.Description;

                Modify(true);
            end;
        }

        field(50506; Location; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location';
        }

        field(50507; Bin; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bin';
            TableRelation = Location;
        }

        field(50508; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }

        field(50509; UserID; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'UserID';
        }

        field(50510; LotNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lot No.';
        }

        field(50511; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Posted';
        }
    }

    keys
    {
        key(Camp1; EntryNo)
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