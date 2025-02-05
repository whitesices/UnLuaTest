local Screen = {}

local PrintString = UE.UKismetSystemLibrary.PrintString

function Screen.Print( text , color , duration)
    color = color or UE.FLinearColor( 1 , 0 , 1 , 1)
    duration = duration or 100
    PrintString( nil , text , true , false , color , duration)
end

return Screen