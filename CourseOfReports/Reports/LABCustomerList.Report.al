report 50500 LABCustomerList
{
    Caption = 'LAB CustomerList';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = Normal;
    DefaultRenderingLayout = Example_EXCELLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting(Name);

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
        }
    }

    rendering
    {
        layout(Example_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './Rld/LABCustomerList.rdl';
            Caption = 'LABCustomerList';
            Summary = 'An example of an RDLC Layout.';
        }
        layout(Example_WORDLayout)
        {
            Type = Word;
            LayoutFile = './Rld/Example_WORDLayout.docx';
            Caption = 'LABCustomerList';
            Summary = 'An example of an WORD Layout.';
        }
        layout(Example_EXCELLayout)
        {
            Type = Excel;
            LayoutFile = './Rld/Example_EXCELLayout.xlsx';
            Caption = 'LABCustomerList';
            Summary = 'An example of an Excel Layout.';
        }
    }
}