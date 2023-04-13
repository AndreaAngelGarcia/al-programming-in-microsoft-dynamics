page 50502 NotPostedAndrea
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StoreAndrea;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}