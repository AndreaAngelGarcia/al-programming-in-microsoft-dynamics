page 50520 DescripcionTrabajoAndrea
{
    Caption = 'Cambia la descripción de trabajo';
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
            }
            field(NuevaDescripcionTrabajo; NuevaDescripcionTrabajo)
            {
                Caption = 'Nueva descripción del trabajo';
                ApplicationArea = All;
                Editable = true;
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
        CodeUnit: Codeunit CampoDescripcionTrabajoAndrea;
    begin
        DescripcionActual := '';
        Rec.CalcFields("Work Description");
        if Rec."Work Description".HasValue then begin
            Rec."Work Description".CreateInStream(inStr);
            inStr.ReadText(DescripcionActual);
        end
        else
            DescripcionActual := 'No existe ninguna descripción';
    end;


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        MiCodeunit: Codeunit CampoDescripcionTrabajoAndrea;
    begin
        if CloseAction in [ACTION::Cancel, ACTION::LookupCancel] then
            exit
        else
            DescripcionActual := NuevaDescripcionTrabajo;
        MiCodeunit.ActualizarDescripcionTrabajo(Rec, NuevaDescripcionTrabajo);
    end;

    var
        myInt: Integer;
        DescripcionActual: Text[200];
        NuevaDescripcionTrabajo: Text[200];
}