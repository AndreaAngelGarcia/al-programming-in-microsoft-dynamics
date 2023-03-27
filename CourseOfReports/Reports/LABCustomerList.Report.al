report 50500 LABCustomerList
{
    Caption = 'LAB CustomerList Andrea';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = Normal;
    DefaultRenderingLayout = Example_EXCELLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
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
            LayoutFile = './Rdl/LABCustomerList.rdl';
            Caption = 'LABCustomerList';
            Summary = 'An example of an RDLC Layout.';
        }
        layout(Example_WORDLayout)
        {
            Type = Word;
            LayoutFile = './Rdl/Example_WORDLayout.docx';
            Caption = 'LABCustomerList';
            Summary = 'An example of an WORD Layout.';
        }
        layout(Example_EXCELLayout)
        {
            Type = Excel;
            LayoutFile = './Rdl/Example_EXCELLayout.xlsx';
            Caption = 'LABCustomerList';
            Summary = 'An example of an Excel Layout.';
        }
    }
}