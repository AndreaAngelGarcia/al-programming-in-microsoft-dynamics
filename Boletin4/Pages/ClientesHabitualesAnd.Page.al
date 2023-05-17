page 50521 ClientesHabitualesPageAnd
{
    Caption = 'Clientes Habituales Andrea';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ClientesHabitualesAndrea;
    DataCaptionFields = CodigoProducto;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Cod. Cliente"; Rec.CodigoCliente)
                {
                    ApplicationArea = All;
                }
                field("Fecha desde"; Rec.FechaDesde)
                {
                    ApplicationArea = All;
                }
                field("Fecha hasta"; Rec.FechaHasta)
                {
                    ApplicationArea = All;
                }
                field(CodigoProducto; Rec.CodigoProducto)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }

        area(Factboxes)
        {

        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
    begin
        if Rec.FechaDesde <> 0D then
            if Rec.FechaHasta = 0D then begin
                Error('Por favor ingrese un valor en el campo "Fecha hasta" antes de continuar.');
            end;
    end;
}