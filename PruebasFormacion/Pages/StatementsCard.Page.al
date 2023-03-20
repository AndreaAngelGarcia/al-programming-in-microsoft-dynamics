page 50115 "Statements Cards"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Card';

    layout
    {
        area(Content)
        {
            group(Entrada)
            {
                Caption = 'Entrada';
                field(Dificultad; Dificultad)
                {
                    Caption = 'Dificultad';
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        GetSugerencia();
                    end;
                }
            }
            group(Salida)
            {
                Caption = 'Salida';
                field(Sugerencia; Sugerencia)
                {
                    Caption = 'Sugerencia';
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Nivel; Nivel)
                {
                    Caption = 'Nivel';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    local procedure GetSugerencia()
    begin
        Nivel := '';
        Sugerencia := '';

        case Dificultad of
            1 .. 5:
                begin
                    Nivel := 'Beginner';
                    Sugerencia := 'Take e-Learning or remote training';
                end;
            6 .. 8:
                begin
                    Nivel := 'Intermediate';
                    Sugerencia := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Nivel := 'Advanced';
                    Sugerencia := 'Attend instructor-Led and self study';
                end;
        end;
    end;

    var
        Nivel: Text[30];
        Sugerencia: Text[80];
        Dificultad: Integer;

}