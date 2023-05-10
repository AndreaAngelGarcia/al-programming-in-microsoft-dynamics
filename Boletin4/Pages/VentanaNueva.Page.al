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
            /*trigger OnValidate()
            var
                SalesInvoiceHeader: Record "Sales Invoice Header";
            begin
                SalesInvoiceHeader.Reset();
                SalesInvoiceHeader.SetRange("No.", SalesInvoiceHeader."No.");
                SalesInvoiceHeader.GetBySystemId('Hola Roberto');
                SalesInvoiceHeader.Get(Rec."Work Description");
                CurrPage.SetSelectionFilter(SalesInvoiceHeader);
            end;*/
            /*begin
               SalesInvoiceHeader.RESET;
               SalesInvoiceHeader.SETRANGE("No.", InvoiceNo.VALUE);
               IF SalesInvoiceHeader.FINDFIRST THEN BEGIN
                   SalesInvoiceHeader."Work Description" := NuevaDescripcion.VALUE;
                   SalesInvoiceHeader.MODIFY;
                   MESSAGE('Descripción del trabajo actualizada.');
               END ELSE
                   MESSAGE('No se encontró la factura especificada.');
           end;*/

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



    var
        myInt: Integer;
        DescripcionActual: Text[200];
        NuevaDescripcionTrabajo: Text[200];
}