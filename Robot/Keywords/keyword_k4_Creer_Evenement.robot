*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

*** Keywords ***
Create event
    [Documentation]
    ...    Creer un événement dans un site 
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin avec le rôle de gestionnaire du site
    ...    Un site déjà créé
    ...    Un site personnalisé où apparait le lien "Calendrier"
    # vQuoi contient le nom de l'événement
    # vLocalisation contient la localisation de l'événement
    # vDescription contient une description
    # vTag contiens une étiquette pour trier l'évènement
    # vSite_Web contiens le nom du site
    [Arguments]    ${vQuoi}    ${vLocalisation}    ${vDescription}    ${vTag}    ${vSite_web}
    #Click sur le nom du site créé
    Wait Until Element Is Visible    ${SiteLinkRacine}'${vSite_web}']
    Click Element    ${SiteLinkRacine}'${vSite_web}']
    #Click sur l’onglet "Calendrier"
    Wait Until Element Is Visible    ${Link_calendrier} 
    Click Element    ${Link_calendrier}   
    #Click sur le button nouvel événement
    Wait Until Element Is Visible    ${Btn_Nouvel_evenement}
    Click Button    ${Btn_Nouvel_evenement}
    #Remplir formulaire Ajouter un événement
    Wait Until Element Is Visible    ${Header_Fenetre}
    Page Should Contain    Ajouter un événement
    #Saisir dans la fênetre de l'ajout les données suivantes:
    # Quoi
    Input Text    ${Txt_quoi}    ${vQuoi}
    # Où
    Input Text    ${Txt_localisation}    ${vLocalisation}
    # Description
    Input Text    name=desc    ${vDescription}
    # Journée entière
    Click Element    ${CheckBox_journee} 
    Checkbox Should Be Selected    ${CheckBox_journee} 
    # Date de début
    Click Element    ${Btn_calendrierPicker_D}
    Click Element    ${Btn_calendrier_jour_D}
    Sleep    2
    # Date de fin
    Click Element    ${Btn_calendrierPicker_F}
    Click Element    ${Btn_calendrier_jour_F}
    # Tags
    Input Text    ${Txt_tag}    ${vTag} 
    Click Button    ${Btn_Ajout}
    Page Should Contain Element    ${Tag_test}
    Sleep    2
    #Click boutton enregistrer
    Click Button    ${Btn_enregistrer}
    #Vérification du popup
    Wait Until Element Is Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
    #Vérifier que le événement existe dans la page
    Page Should Contain    ${vQuoi}
    #Retour à la page accueil
    Click Link    ${Link_Accueil}
