reportextension 50110 StandardSalesInvoice extends "Standard Sales - Invoice"
{
    dataset
    {
        // Add changes to dataitems and columns here
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'RdlExt/mylayout.rdl';
        }
    }
}