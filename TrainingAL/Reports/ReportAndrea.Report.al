report 50500 ReportAndrea
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(Cliente; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(Post_Code; "Post Code")
            {

            }
            column(City; City)
            {

            }
            dataitem("Ship-to Address"; "Ship-to Address")
            {
                DataItemLinkReference = Cliente;
                DataItemLink = Code = field("Ship-to Code"), "Customer No." = field("No.");
                column(Direccion; Address)
                {

                }
                column(CP; "Post Code")
                {

                }
                column(Ciudad; City)
                {

                }
            }
            dataitem("Customer Bank Account"; "Customer Bank Account")
            {
                DataItemLinkReference = Cliente;
                DataItemLink = Code = field("Preferred Bank Account Code"), "Customer No." = field("No.");
                column(NBanco; Name)
                {

                }
                column(PC; "Post Code")
                {

                }
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
            LayoutFile = './Rdl/ReportAndrea.rdl';
        }
    }

    var
        myInt: Integer;
}