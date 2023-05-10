page 50510 VentanaNuevaAndrea
{
    Caption = 'Cambia la descripción de trabajo';
    //DeleteAllowed = false;
    //InsertAllowed = false;
    PageType = StandardDialog;
    SourceTable = "Sales Invoice Header";
    Permissions = tabledata "Sales Invoice Header" = RIMD;

    layout
    {
        area(Content)
        {
            field(DescripcionActual; DescripcionActual)
            {
                Caption = 'Descripción de trabajo actual';
                ApplicationArea = All;
                Editable = false;
                AccessByPermission = codeunit NuevoCampoDescripcionTrabajo = X;
            }
            field(NuevaDescripcionTrabajo; NuevaDescripcionTrabajo)
            {
                Caption = 'Nueva descripción del trabajo';
                ApplicationArea = All;
                Editable = true;
                AccessByPermission = codeunit NuevoCampoDescripcionTrabajo = X;

                trigger OnValidate()
                var
                    outStr: OutStream;
                begin
                    DescripcionActual := NuevaDescripcionTrabajo;
                    Rec."Work Description".CreateOutStream(outStr);
                    outStr.WriteText(NuevaDescripcionTrabajo);
                    Rec.Modify(true);
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        inStr: InStream;
        outStr: OutStream;
        CodeUnit: Codeunit NuevoCampoDescripcionTrabajo;
    begin
        DescripcionActual := '';
        Rec.CalcFields("Work Description");
        if Rec."Work Description".HasValue then begin
            Rec."Work Description".CreateInStream(inStr);
            inStr.ReadText(DescripcionActual);
        end
        else
            DescripcionActual := 'No existe ninguna descripción';

        /*DescripcionActual := NuevaDescripcionTrabajo;
        Rec."Work Description".CreateOutStream(outStr);
        outStr.WriteText(NuevaDescripcionTrabajo);
        Rec.Modify(true);*/
    end;

    var
        myInt: Integer;
        DescripcionActual: Text[200];
        NuevaDescripcionTrabajo: Text[200];
}