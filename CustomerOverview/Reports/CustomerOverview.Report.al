report 50111 CustomerOverviewReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RDL;

    dataset
    {
        dataitem(CustomerOverview; CustomerOverviewAndrea)
        {
            column(NCliente; NCliente)
            {

            }

            column(NombreCliente; NombreCliente)
            {

            }

            column(Importe; Importe)
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
        layout(RDL)
        {
            Type = RDLC;
            LayoutFile = 'Rdl/CustomerOverview.rdl';
        }
        layout(Word)
        {
            Type = Word;
            LayoutFile = 'Rdl/CustomerOverview.docx';
        }
    }

    var
        myInt: Integer;
}