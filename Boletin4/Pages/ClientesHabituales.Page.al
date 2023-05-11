page 50511 PageClientesHabitualesAndrea
{
    Caption = 'Clientes Habituales Andrea';
    PageType = List;
    ApplicationArea = All;
    //Editable = false;
    UsageCategory = Lists;
    SourceTable = ClientesHabitualesAndrea;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}