/*codeunit 50530 CrearProveedorAndrea
{
    trigger OnRun()
    var
        TeamMemberVendor: Record "TablaProveedorTeamMember";
    begin
        TeamMemberVendor.SetFilter(Processed, 'No');
        if TeamMemberVendor.FindSet() then
            repeat
                CrearProveedor(TeamMemberVendor);
                //AsignarContacto(TeamMemberVendor);
                TeamMemberVendor.Processed := true;
                TeamMemberVendor.Modify();
            until TeamMemberVendor.Next() = 0;
    end;*/

/// <summary>
/// Procedure para crear un nuevo proveedor
/// </summary>
/*procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
var
    TeamMemberVendor: Record "TablaProveedorTeamMember";
    Vendor: Record Vendor;
    Contact: Record Contact;
begin
    TeamMemberVendor.SetRange("Cod. Comprador", Vendor."Purchaser Code");

    Vendor.Init();
    Vendor.Name := TeamMemberVendorRec.Name;
    Vendor."Purchaser Code" := TeamMemberVendorRec."Cod. Comprador";
    Vendor."VAT Registration No." := TeamMemberVendorRec."VAT Registration No.";
    Vendor.Address := TeamMemberVendorRec.Address;
    Vendor."Country/Region Code" := TeamMemberVendorRec."Country/Region Code";
    Vendor.City := TeamMemberVendorRec.City;
    Vendor."Post Code" := TeamMemberVendorRec."Post Code";
    Vendor."E-Mail" := TeamMemberVendorRec."E-Mail";
    Vendor."Phone No." := TeamMemberVendorRec."Phone No.";
    Vendor."Gen. Bus. Posting Group" := TeamMemberVendorRec."Gen. Bus. Posting Group";
    Vendor."VAT Bus. Posting Group" := TeamMemberVendorRec."VAT Bus. Posting Group";
    Vendor."Vendor Posting Group" := TeamMemberVendorRec."Vendor Posting Group";
    Vendor."Payment Method Code" := TeamMemberVendorRec."Payment Method Code";
    Vendor."Payment Terms Code" := TeamMemberVendorRec."Payment Terms Code";
    /*CONTACTO*/
//Vendor."Primary Contact No." := TeamMemberVendorRec."Primary Contact No.";
//Vendor.Contact := TeamMemberVendorRec.Contact;
//Vendor.SetFilter(Contact."No.", '%1%', );

/*Vendor."Primary Contact No." := TeamMemberVendorRec."Primary Contact No.";
Vendor.Contact := TeamMemberVendorRec.Contact;
Contact.SetRange("Company No.", Vendor."No.");
if Contact.FindFirst() then
    Vendor."Primary Contact No." := Contact."No.";*/
//Vendor.Insert(true);

// Asignar el contacto al proveedor
// Asignar el contacto al proveedor
/*Contact.SetRange("Company No.", Vendor."No.");
if Contact.FindFirst() then begin
    Vendor.Get(Vendor."No.");
    Vendor."Primary Contact No." := Contact."No.";
    Vendor.Modify();
    Message('el contacto del proveedor es');
end;

/*Vendor."Primary Contact No." := TeamMemberVendorRec.Contact;
Contact.SetRange("No.", TeamMemberVendorRec.Contact);
if Contact.FindFirst() then
    Vendor."Primary Contact No." := Contact."No.";
Vendor.Insert(true);*/
//end;
//}

/// <summary>
/// Procedure para asignar un contacto al proveedor
/// </summary>
/*procedure AsignarContacto(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
var
    Vendor: Record Vendor;
    Contact: Record Contact;
begin
    Contact.SetRange("Company No.", Vendor."No.");
    if Contact.FindFirst() then
        Vendor."Primary Contact No." := Contact."No.";
    Vendor.Modify();
end;
}*/

codeunit 50530 CrearProveedorAndrea
{
    trigger OnRun()
    var
        TeamMemberVendor: Record "TablaProveedorTeamMember";
        VendorNo: Code[20];
    begin
        TeamMemberVendor.SetFilter(Processed, 'No');
        if TeamMemberVendor.FindSet() then
            repeat
                VendorNo := CrearProveedor(TeamMemberVendor);
                AsignarContacto(VendorNo);
                TeamMemberVendor.Processed := true;
                TeamMemberVendor.Modify();
            until TeamMemberVendor.Next() = 0;
    end;

    /// <summary>
    /// Procedure para crear un nuevo proveedor
    /// </summary>
    procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember"): Code[20]
    var
        Vendor: Record Vendor;
    begin
        Vendor.Init();
        Vendor.Name := TeamMemberVendorRec.Name;
        Vendor."Purchaser Code" := TeamMemberVendorRec."Cod. Comprador";
        Vendor."VAT Registration No." := TeamMemberVendorRec."VAT Registration No.";
        Vendor.Address := TeamMemberVendorRec.Address;
        Vendor."Country/Region Code" := TeamMemberVendorRec."Country/Region Code";
        Vendor.City := TeamMemberVendorRec.City;
        Vendor."Post Code" := TeamMemberVendorRec."Post Code";
        Vendor."E-Mail" := TeamMemberVendorRec."E-Mail";
        Vendor."Phone No." := TeamMemberVendorRec."Phone No.";
        Vendor."Gen. Bus. Posting Group" := TeamMemberVendorRec."Gen. Bus. Posting Group";
        Vendor."VAT Bus. Posting Group" := TeamMemberVendorRec."VAT Bus. Posting Group";
        Vendor."Vendor Posting Group" := TeamMemberVendorRec."Vendor Posting Group";
        Vendor."Payment Method Code" := TeamMemberVendorRec."Payment Method Code";
        Vendor."Payment Terms Code" := TeamMemberVendorRec."Payment Terms Code";
        Vendor.Insert(true);
        exit(Vendor."No.");
    end;

    /// <summary>
    /// Procedure para asignar un contacto al proveedor
    /// </summary>
    procedure AsignarContacto(VendorNo: Code[20])
    var
        Vendor: Record Vendor;
        Contact: Record Contact;
    begin
        Vendor.Get(VendorNo);
        Contact.SetRange("Company No.", Vendor."No.");
        if Contact.FindFirst() then
            Vendor."Primary Contact No." := Contact."No.";
        Vendor.Modify();
    end;
}



/*procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
var
    TeamMemberVendor: Record "TablaProveedorTeamMember";
    Vendor: Record Vendor;
    Contact: Record Contact;
begin
    TeamMemberVendor.SetRange("Cod. Comprador", Vendor."Purchaser Code");

    Vendor.Init();
    Vendor.Name := TeamMemberVendorRec.Name;
    Vendor."Purchaser Code" := TeamMemberVendorRec."Cod. Comprador";
    Vendor."VAT Registration No." := TeamMemberVendorRec."VAT Registration No.";
    Vendor.Address := TeamMemberVendorRec.Address;
    Vendor."Country/Region Code" := TeamMemberVendorRec."Country/Region Code";
    Vendor.City := TeamMemberVendorRec.City;
    Vendor."Post Code" := TeamMemberVendorRec."Post Code";
    Vendor."E-Mail" := TeamMemberVendorRec."E-Mail";
    Vendor."Phone No." := TeamMemberVendorRec."Phone No.";
    Vendor."Gen. Bus. Posting Group" := TeamMemberVendorRec."Gen. Bus. Posting Group";
    Vendor."VAT Bus. Posting Group" := TeamMemberVendorRec."VAT Bus. Posting Group";
    Vendor."Vendor Posting Group" := TeamMemberVendorRec."Vendor Posting Group";
    Vendor."Payment Method Code" := TeamMemberVendorRec."Payment Method Code";
    Vendor."Payment Terms Code" := TeamMemberVendorRec."Payment Terms Code";
    Vendor.Insert(true);

    // Asignar el contacto al proveedor
    if BuscarContacto(Vendor."No.", Contact) then begin
        Message('No.: %1', Vendor."No.");
        Vendor.Get(Vendor."No.");
        Vendor."Primary Contact No." := Contact."No.";
        Vendor.Modify();
    end;
end;

/// <summary>
/// Función para buscar el contacto asociado con un proveedor
/// </summary>
local procedure BuscarContacto(ProveedorNo: Code[20]; var Contacto: Record Contact) Resultado: Boolean
begin
    Contacto.SetRange("Company No.", ProveedorNo);
    Resultado := Contacto.FindFirst();
end;
}*/
