page 50500 CardPageAndrea
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PTE tableAndrea";

    layout
    {
        area(Content)
        {
            group(GrupoNuevo)
            {
                Caption = 'General';
                field(Camp1; Rec.Camp1)
                {
                    ApplicationArea = All;

                }
                field(Camp2; Rec.Camp2)
                {
                    ApplicationArea = All;
                }
                field(Camp3; Rec.Camp3)
                {
                    ApplicationArea = All;
                }
            }
            group(Otros)
            {
                Caption = 'General';
                field(Camp4; Rec.Camp4)
                {
                    ApplicationArea = All;

                }
                field(Camp5; Rec.Camp5)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AccionNueva)
            {
                ApplicationArea = All;
                Caption = 'Acción nueva en ficha';

                trigger OnAction();
                var
                    numero1, numero2, numero3 : Integer;
                begin
                    numero1 := 25;
                    numero2 := 5;
                    numero3 := 3;
                    Message('La multiplicación de la operacion es: ' + Format(numero1 * numero2 * numero3));
                end;
            }
        }
    }

    var
        myInt: Integer;
}