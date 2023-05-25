tableextension 50530 CampoID extends Vendor
{
    fields
    {
        field(50530; IDPK; Integer)
        {
            TableRelation = TablaProveedorTeamMember;
        }
    }

    /*trigger OnInsert()
    var
        TeamMember: Record TablaProveedorTeamMember;
    begin
        // Obtener el registro relacionado en la tabla TablaProveedorTeamMember
        if TeamMember.Get(Rec.IDPK) then begin
            // Asignar el valor del campo ID al campo IDPK
            Rec.IDPK := TeamMember.ID;
            Error('Test');
            Rec.Modify();
            Error('Test');
        end;
    end;*/

    var
        myInt: Integer;
}






