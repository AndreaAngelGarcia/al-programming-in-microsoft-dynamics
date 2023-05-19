codeunit 50530 JobQueueEntriesAndrea
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        Message('Hola Andrea');
    end;

    var
        myInt: Integer;
}