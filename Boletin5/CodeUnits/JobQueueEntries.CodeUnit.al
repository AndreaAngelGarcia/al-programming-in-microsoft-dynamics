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
        Contact: Record Contact;
    begin
        TeamMemberVendor.SetRange("Cod. Comprador", Vendor."Purchaser Code");

        Vendor.Init();
        Vendor.Name := TeamMemberVendorRec.Name;
        Vendor."Purchaser Code" := TeamMemberVendorRec."Cod. Comprador";
        Vendor.Address := TeamMemberVendorRec.Address;
        Vendor."Country/Region Code" := TeamMemberVendorRec."Country/Region Code";
        Vendor.City := TeamMemberVendorRec.City;
        Vendor."Post Code" := TeamMemberVendorRec."Post Code";
        Vendor."E-Mail" := TeamMemberVendorRec."E-Mail";
        Vendor."Phone No." := TeamMemberVendorRec."Phone No.";
        Vendor."Primary Contact No." := TeamMemberVendorRec."Primary Contact No.";
        Vendor.Contact := TeamMemberVendorRec.Contact;
        if Contact.FindFirst() then
            Vendor."Primary Contact No." := Contact."No.";
        Vendor.Insert(true);
    end;
}










