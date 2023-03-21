pageextension 50113 CreditLimitExtension extends "Customer Card"
{
    layout
    {

    }

    actions
    {
        addafter("F&unctions")
        {
            action("UpdateCreditLimit")
            {
                Caption = 'Update Credit Limit';
                Image = CalculateCost;

                trigger OnAction()

                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }

    var
        AreYouSureQst: Label '¿Está seguro de que desea establecer %1 como %2?';
        CreditLimitRoundedTxt: Label 'El límite de crédito se redondeó a %1 para cumplir con las directivas de la empresa.';
        CreditLimitUpToDateTxt: Label 'El límite de crédito está actualizado.';

    local procedure CallUpdateCreditLimit()
    var
        NewCreditLimit: Decimal;
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitRoundedTxt, CreditLimitActual);
    end;

}

