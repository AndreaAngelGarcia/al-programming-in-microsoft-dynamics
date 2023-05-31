pageextension 50332 MovsProyectoAndrea extends "Job Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field(NombreProveedor; Rec.NombreProveedor)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}