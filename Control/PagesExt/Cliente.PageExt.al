pageextension 50550 CustomerCocheAndrea extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            group(CochesAndrea)
            {
                Caption = 'Coches Andrea';
                field(CodigoCoche; Rec.CodigoCoche)
                {
                    ApplicationArea = All;
                }

                field(DescripcionCoche; Rec.DescripcionCoche)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {

    }

    trigger OnAfterGetRecord()
    var
        Coches: Record CochesAndrea;
    begin
        Coches.SetRange(Codigo, Rec.CodigoCoche);
        if Coches.FindFirst() then begin
            Rec.DescripcionCoche := Coches.Descripcion;
            Rec.Modify();
        end else begin
            Rec.DescripcionCoche := 'No existe ningún coche para este cliente';
            Rec.Modify();
        end;
    end;

    var
        myInt: Integer;
}