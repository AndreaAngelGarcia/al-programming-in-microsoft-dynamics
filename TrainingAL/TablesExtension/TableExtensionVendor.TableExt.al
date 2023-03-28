tableextension 50500 TableExtensionVendor extends Vendor
{
    fields
    {
        field(50500; Camp1; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50501; Camp2; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        modify(Name)
        {
            trigger OnAfterValidate()
            var
                CU: Codeunit CodeUnitEjemploAndrea;
            begin
                CU.MensajitoTabla();
            end;
        }
    }

    /*trigger OnBeforeDelete()
    var
        myInt: Integer;
    begin
        //Borrame los registros asociados a la tabla
    end;*/

    var
        myInt: Integer;
}
