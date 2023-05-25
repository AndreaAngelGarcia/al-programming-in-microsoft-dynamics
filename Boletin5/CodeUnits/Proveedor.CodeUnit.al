codeunit 50530 CrearProveedorAndrea
{
    trigger OnRun()
    var
        TeamMemberVendor: Record "TablaProveedorTeamMember";
        VendorN: Code[10];
    begin
        TeamMemberVendor.SetFilter(Processed, 'No');
        if TeamMemberVendor.FindSet() then begin
            repeat
                VendorN := CrearProveedor(TeamMemberVendor);
                TeamMemberVendor.Processed := true;
                TeamMemberVendor.Modify();
            until TeamMemberVendor.Next() = 0;
        end else begin
            // Buscar registros procesados donde SystemModifiedAt > SystemCreatedAt
            TeamMemberVendor.SetRange(Processed, true);
            TeamMemberVendor.SetFilter(SystemModifiedAt, '> %1', TeamMemberVendor.SystemCreatedAt);
            if TeamMemberVendor.FindSet() then begin
                Message('He entrado jeje');
                repeat
                    // Llamar a la función ModificarProveedor para cada registro encontrado
                    ModificarProveedor(TeamMemberVendor);
                until TeamMemberVendor.Next() = 0;
            end;
        end;
    end;

    /// <summary>
    /// Procedure para crear un nuevo proveedor
    /// </summary>
    procedure CrearProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember"): Code[20]
    var
        Vendor: Record Vendor;
        Contact: Record Contact;
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

        Vendor.IDPK := TeamMemberVendorRec.ID;
        Vendor.Modify();

        //Asignamos un contacto a nuestro proveedor creado anteriormente
        Contact.SetRange(Name, Vendor.Name);
        Contact.SetRange("Phone No.", Vendor."Phone No.");
        if Contact.FindFirst() then begin
            Vendor."Primary Contact No." := Contact."No.";
            Vendor.Modify();
        end;
    end;

    procedure ModificarProveedor(TeamMemberVendorRec: Record "TablaProveedorTeamMember")
    var
        Vendor: Record Vendor;
    begin
        TeamMemberVendorRec.SetRange(ID, Vendor.IDPK);
        // Buscar el registro del proveedor existente
        //Vendor.SetRange(IDPK, TeamMemberVendorRec.ID);
        //Vendor.SetRange(Name, TeamMemberVendorRec.Name);
        if TeamMemberVendorRec.FindFirst() then begin
            // Modificar los campos del registro del proveedor
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

            // Guardar los cambios en el registro del proveedor
            Vendor.Modify();
        end else begin
            Message('No se encontró el registro del proveedor');
        end;
    end;

}
