pageextension 50530 PageExtListaProveedores extends "Vendor List"
{
    layout
    {
        /*addfirst(Control1)
        {
            field(ID; Rec.IDPK)
            {
                Caption = 'ID';
                ApplicationArea = All;
            }
        }*/
    }

    actions
    {
        addfirst(processing)
        {
            action(CrearNuevoProveedor)
            {
                ApplicationArea = All;
                Caption = 'Crear nuevo proveedor Andrea';
                Image = Add;

                trigger OnAction()
                var
                    TeamMember: Record TablaProveedorTeamMember;
                begin
                    TeamMember.Init();
                    Page.Run(PAGE::PageProveedorTeamMember);
                end;
            }

            action(CrearCodeUnit)
            {
                ApplicationArea = All;
                Caption = 'Crear nueva codeunit Andrea';
                Image = CodesList;

                trigger OnAction()
                var
                    JobQueueEntry: Record "Job Queue Entry";
                begin
                    JobQueueEntry.SetRange("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
                    JobQueueEntry.SetRange("Object ID to Run", 50530);
                    if not JobQueueEntry.FindFirst() then begin
                        JobQueueEntry.Init();
                        JobQueueEntry."Object Type to Run" := JobQueueEntry."Object Type to Run"::Codeunit;
                        JobQueueEntry."Object ID to Run" := 50530; // MI ID
                        JobQueueEntry."Maximum No. of Attempts to Run" := 1;
                        JobQueueEntry.Description := 'CrearProveedorAndrea';
                        JobQueueEntry.Status := JobQueueEntry.Status::"On Hold";
                        JobQueueEntry.Insert(true);
                        Message('La codeunit "CrearProveedorAndrea" se ha agregado correctamente a la cola de proyecto.');
                    end else begin
                        Message('La codeunit "CrearProveedorAndrea" ya existe en la cola de proyecto.');
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}

