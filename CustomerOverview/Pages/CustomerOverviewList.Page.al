page 50112 ListaDeVistaGeneralDeCliente
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomerOverviewAndrea;
    Caption = 'Course Overview List Andrea';
    Editable = false;
    CardPageId = CustomerOverviewCard;

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
                    UpdateCustomerOverview.Run();
                end;
            }

            action(ModificarRegistros)
            {
                Caption = 'Modify Records';
                Image = Edit;
                ApplicationArea = All;

                trigger OnAction();

                var
                    CustomerOverview: Record CustomerOverviewAndrea;
                    Customer: Record Customer;
                begin
                    CurrPage.SetSelectionFilter(CustomerOverview);
                    Customer.SetRange("No.", CustomerOverview.NCliente);
                    while CustomerOverview.Next() <> 0 do begin
                        if CustomerOverview.Importe < 0 then begin
                            Message('No se puede modificar uno de los clientes seleccionados porque tiene un importe negativo');
                        end else begin
                            if Customer.get(CustomerOverview.NCliente) then begin
                                Customer.Name := 'Andrea Angel Gomez';
                                CustomerOverview.NombreCliente := 'Andrea Angel Gomez';
                                CustomerOverview.Modify(true);
                                Customer.Modify(true);
                            end;
                        end;
                    end;
                end;
            }

            action(EliminarRegistros)
            {
                Caption = 'Delete Records';
                Image = Import;
                ApplicationArea = All;

                trigger OnAction();

                var
                    CustomerOverview: Record CustomerOverviewAndrea;
                begin
                    CurrPage.SetSelectionFilter(CustomerOverview);
                    while CustomerOverview.Next() <> 0 do begin
                        if CustomerOverview.Importe < 0 then begin
                            ERROR('No se puede borrar uno de los clientes seleccionados porque tiene un importe negativo.');
                        end
                        else begin
                            CustomerOverview.Delete(true);
                        end;
                    end;
                end;
            }

            action(EliminarTodosLosRegistros)
            {
                Caption = 'Delete All Records';
                Image = Import;
                ApplicationArea = All;

                trigger OnAction();

                var
                    CustomerOverview: Record CustomerOverviewAndrea;
                begin

                    CustomerOverview.DeleteAll();
                end;
            }

            action(PrintReport)
            {
                Caption = 'Print Report';
                Image = Import;
                ApplicationArea = All;

                trigger OnAction();

                var
                    CustomerOverview: Record CustomerOverviewAndrea;
                begin
                    report.Run(Report::CustomerOverviewReport);
                end;
            }
        }
    }
}
