page 50550 CochesAndreaPage
{
    PageType = Card;
    Caption = 'Coches Andrea';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CochesAndrea;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Añadir coches';
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
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

    var
        myInt: Integer;
}