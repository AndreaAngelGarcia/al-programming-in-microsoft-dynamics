codeunit 50110 "AdministracionGeneralDeCliente"
{
    trigger OnRun()
    begin
        Clear(SourceCode);
        Clear(CustomerOverview);
        Clear(GLEntry);

        if CustomerOverview.FindLast() then
            NextEntryNo := CustomerOverview."NMovimiento" + 1
        else
            NextEntryNo := 1;

        if SourceCode.FindSet() then
            repeat
                if Customer.FindSet() then
                    repeat
                        GLEntry.SetRange("Source Type", GLEntry."Source Type"::Customer);
                        GLEntry.SetRange("Source Code", SourceCode.Code);
                        GLEntry.SetRange("Source No.", Customer."No.");
                        if GLEntry.FindSet() then begin
                            GLEntry.CalcSums(GLEntry.Amount);
                            CustomerOverview."NMovimiento" := NextEntryNo;
                            CustomerOverview.NCliente := Customer."No.";
                            CustomerOverview.NombreCliente := Customer.Name;
                            CustomerOverview.CodigoOrigen := SourceCode.Code;
                            CustomerOverview.Importe := GLEntry.Amount;
                            CustomerOverview.LastRunDate := CurrentDateTime();
                            CustomerOverview.Insert();
                            NextEntryNo += 1;
                        end;
                    until Customer.Next() = 0;
            until SourceCode.Next() = 0
    end;

    var
        myInt: Integer;
        CustomerOverview: Record VistaGeneralDelCliente;
        Customer: Record Customer;
        SourceCode: Record "Source Code";
        GLEntry: Record "G/L Entry";
        NextEntryNo: Integer;
}