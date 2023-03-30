report 50501 InvoiceSales
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Amount; Amount)
            {

            }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Line_Amount; "Line Amount")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'Rdl/SalesInvoice.rdl';
        }
    }


    var
        myInt: Integer;
}