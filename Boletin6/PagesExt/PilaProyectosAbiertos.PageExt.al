pageextension 50330 ProyectosAbiertosAnd extends "O365 Activities"
{
    layout
    {
        addlast(content)
        {
            cuegroup("Proyectos abiertos")
            {
                Caption = 'Pilas Andrea';
                field(ProyectosAbiertosAnd; Rec.ProyectosAbiertosAnd)
                {
                    ApplicationArea = All;
                }

                field(ColasErrorAnd; Rec.ColasErrorAnd)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}