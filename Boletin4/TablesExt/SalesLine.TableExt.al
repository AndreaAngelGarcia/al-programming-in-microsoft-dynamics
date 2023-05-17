tableextension 50521 SalesLineExt extends "Sales Line"
{
    fields
    {
        // Añadimos el nuevo campo para saber si es cliente habitual
        field(50520; "ClienteHabitual"; Boolean)
        {
            Caption = 'Es cliente habitual';
        }
    }

    trigger OnAfterModify()
    var
        ClienteHabitual: Record ClientesHabitualesAndrea;
        SalesHeader: Record "Sales Header";
        FieldNumber: Integer;
    begin
        /*if FieldNumber = FieldNo("No.") then
            ClienteHabitual := not IsHabitualProduct();*/

        if not ClienteHabitual.Get("No.") then begin
            Message('El cliente no se encontró en la tabla ClientesHabitualesAndrea.'); // Agrega esta línea para verificar si el cliente se encontró en la tabla
            exit
        end;

        if (ClienteHabitual."FechaDesde" = 0D) or (ClienteHabitual."FechaHasta" = 0D) then begin
            Message('El cliente es habitual porque no tiene fechas definidas.'); // Agrega esta línea para verificar si el cliente es habitual porque no tiene fechas definidas
            exit
        end;

        if (ClienteHabitual."FechaDesde" <= SalesHeader."Posting Date") and (ClienteHabitual."FechaHasta" >= SalesHeader."Posting Date") then begin
            Message('El cliente es habitual porque la fecha de la factura está dentro del rango de fechas.'); // Agrega esta línea para verificar si el cliente es habitual porque la fecha de la factura está dentro del rango de fechas
            exit
        end;

        Message('El cliente no es habitual.'); // Agrega esta línea para verificar si el cliente no es habitual por ninguna de las razones anteriores
        exit
    end;

    var
        myInt: Integer;
}