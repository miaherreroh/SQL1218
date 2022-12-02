*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

*** Keywords ***
Remove event
    [Documentation]
    ...    Supprimer un évènement dans un site 
    ...    Il est neccesaire:
    ...    Un conexion d'utilisateur simple
    ...    Un site déjà créé
    ...    Un évènement créé dans le "Calendrier" appartenant le sous-menu d'un site
    # vNom_evenement contient le nom du évènement
    # vSite_Web contiens le nom du site
    [Arguments]    ${vNom_evenement}    ${vSite_web}
    #Click sur le nom du site créé
    Wait Until Element Is Visible    ${SiteLinkRacine}'${vSite_web}']
    Click Element    ${SiteLinkRacine}'${vSite_web}']
    #Click sur l’onglet "Calendrier"
    Wait Until Element Is Visible    ${Link_calendrier} 
    Click Element    ${Link_calendrier} 
    #Click sur l'évènement à eliminer 
    Wait Until Page Contains    ${vNom_evenement}
    Click Element   ${Link_cas_de_test}${vNom_evenement}"]    
    #S'assurer que s'affiche la fenêtre
    Wait Until Element Is Visible    ${Header_fenetre_info_evenement}
    Page Should Contain    Informations sur l'événement
    #Click sur le boutton supprimer
    Click Button    ${Btn_supprimer}
    #Un message de confirmation de suppression s'affiche sur l'écran 
    Page Should Contain    Supprimer l'événement
    #Click sur le button supprimer definitivement
    Click Button    ${Btn_confirmation_supprimer_evenement}
    #Vérification du popup
    Wait Until Element Is Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
    #Vérifier que le événement existe dans la page
    Page Should not Contain    ${vNom_evenement}
    #Retour à la page accueil
    Click Link    ${Link_Accueil}

