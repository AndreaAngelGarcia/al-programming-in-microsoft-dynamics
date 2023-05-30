page 50551 LogsAndrea
{
    PageType = Card;
    Caption = 'Logs Andrea';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = LogsAndrea;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CodigoCoche; Rec.CodigoCoche)
                {
                    ApplicationArea = All;

                }
                field(NDocumento; Rec.NDocumento)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {

    }
}