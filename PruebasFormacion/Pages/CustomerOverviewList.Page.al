page 50112 ListaDeVistaGeneralDeCliente
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = VistaGeneralDelCliente;
    Caption = 'Course Overview List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(NMovimiento; Rec.NMovimiento)
                {
                    ApplicationArea = All;

                }
                field(NCliente; Rec.NCliente)
                {
                    ApplicationArea = All;

                }
                field(NombreCliente; Rec.NombreCliente)
                {
                    ApplicationArea = All;

                }
                field(CodigoOrigen; Rec.CodigoOrigen)
                {
                    ApplicationArea = All;

                }
                field(Importe; Rec.Importe)
                {
                    ApplicationArea = All;

                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportarRegistros)
            {
                Caption = 'Import Records';
                Image = Import;
                ApplicationArea = All;

                trigger OnAction();

                var
                    UpdateCustomerOverview: Codeunit AdministracionGeneralDeCliente;

                begin


                end;

            }
        }
    }
}