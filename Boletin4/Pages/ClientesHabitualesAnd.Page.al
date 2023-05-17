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
    begin
        if (Rec.FechaDesde <> 0D) and (Rec.FechaHasta = 0D) or (Rec.FechaHasta <> 0D) and (Rec.FechaDesde = 0D) then
            Error('No puedes dejar una fecha sin rellenar')
    end;
}