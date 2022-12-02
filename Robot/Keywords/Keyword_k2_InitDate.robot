*** Settings ***
Library    String
Library    DateTime 
Library    BuiltIn 

*** Keywords ***
Init Date
    ${vDateSys}=    Get Current Date    exclude_millis=yes
    ${vDate}=    Get Substring   ${vDateSys}    0    10
    ${vHeure}=    Get Substring   ${vDateSys}    11    13
    ${vMinute}=    Get Substring   ${vDateSys}    14    16
    ${vSeconde}=    Get Substring   ${vDateSys}    17    19
    ${vCompleteDate}=    catenate    ${vDate}-${vHeure}${vMinute}${vSeconde}
    [return]    ${vCompleteDate} 