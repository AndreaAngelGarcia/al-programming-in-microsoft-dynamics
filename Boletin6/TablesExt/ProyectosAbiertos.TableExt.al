tableextension 50330 ProyectosAbiertosTableExtAnd extends "Activities Cue"
{
    fields
    {
        field(50300; ProyectosAbiertosAnd; Integer)
        {
            CalcFormula = COUNT("Job" WHERE("Status" = CONST(Open)));
            Caption = ' Proyectos Abiertos';
            FieldClass = FlowField;
        }

        field(50301; ColasErrorAnd; Integer)
        {
            CalcFormula = COUNT("Job Queue Entry" WHERE("Status" = CONST(Error)));
            Caption = 'Colas en estado error';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}