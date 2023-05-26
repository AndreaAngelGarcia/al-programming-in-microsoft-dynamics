tableextension 50530 CampoID extends Vendor
{
    fields
    {
        field(50530; IDPK; Integer)
        {
            TableRelation = TablaProveedorTeamMember;
        }
    }

    var
        myInt: Integer;
}






