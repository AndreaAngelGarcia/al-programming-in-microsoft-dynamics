pageextension 50530 PageExtListaProveedores extends "Vendor List"
{
    layout
    {

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
                    // Verificar si la codeunit ya existe en la cola
                    JobQueueEntry.SetRange("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
                    JobQueueEntry.SetRange("Object ID to Run", 50530);
                    if JobQueueEntry.FindFirst() then begin
                        // Mostrar mensaje de error
                        Message('La codeunit "CrearProveedorAndrea" ya existe en la cola de trabajos.');
                    end else begin
                        // Agregar la codeunit a la cola de trabajos
                        JobQueueEntry.Init();
                        JobQueueEntry."Object Type to Run" := JobQueueEntry."Object Type to Run"::Codeunit;
                        JobQueueEntry."Object ID to Run" := 50530; //  MI ID
                        JobQueueEntry."Maximum No. of Attempts to Run" := 1;
                        JobQueueEntry.Status := JobQueueEntry.Status::Ready;
                        JobQueueEntry.Insert(true);
                        // Mostrar mensaje de éxito
                        Message('La codeunit "CrearProveedorAndrea" se ha agregado correctamente a la cola de trabajos.');
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}





