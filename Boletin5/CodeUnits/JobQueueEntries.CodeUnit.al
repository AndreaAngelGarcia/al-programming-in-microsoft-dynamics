codeunit 50530 CrearProveedorAndrea
{
    trigger OnRun()
    var
        TeamMemberVendor: Record "TablaProveedorTeamMember";
    begin
        TeamMemberVendor.SetFilter(Processed, 'No');
        if TeamMemberVendor.FindSet() then
            repeat
                CrearProveedor(TeamMemberVendor);
                TeamMemberVendor.Processed := true;
                TeamMemberVendor.Modify();
            until TeamMemberVendor.Next() = 0;
    end;

    procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
    var
        TeamMemberVendor: Record "TablaProveedorTeamMember";
        Vendor: Record Vendor;
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
    end;
}




















































































