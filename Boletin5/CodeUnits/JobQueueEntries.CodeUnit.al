codeunit 50530 CrearProveedorAndrea
{
    procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
    var
        Vendor: Record Vendor;
        TeamMemberVendor: Record "TablaProveedorTeamMember";
    begin
        TeamMemberVendor.SetRange("Cod. Comprador", Vendor."Purchaser Code");
        Vendor.Init();
        Vendor."Purchaser Code" := TeamMemberVendorRec."Cod. Comprador";
        Vendor.Name := TeamMemberVendorRec.Name;
        Vendor.Address := TeamMemberVendorRec.Address;
        Vendor."Country/Region Code" := TeamMemberVendorRec."Country/Region Code";
        Vendor.City := TeamMemberVendorRec.City;
        Vendor."Post Code" := TeamMemberVendorRec."Post Code";
        Vendor."Phone No." := TeamMemberVendorRec."Phone No.";

        Vendor.Insert(true);

        TeamMemberVendor.ClearMarks();
        TeamMemberVendorRec.ClearMarks();
        /*Message('No.: %1', TeamMemberVendorRec."Cod. Comprador");
        Message('Name: %1', TeamMemberVendorRec.Name);
        Message('Address: %1', TeamMemberVendorRec.Address);*/
    end;

    [EventSubscriber(ObjectType::Page, Page::"PageProveedorTeamMember", 'OnOpenPageEvent', '', true, true)]
    local procedure MyProcedure()
    var
        Proveedor: Page PageProveedorTeamMember;
        TablaProveedor: Record TablaProveedorTeamMember;
    begin
        Clear(Proveedor);
    end;

}




















