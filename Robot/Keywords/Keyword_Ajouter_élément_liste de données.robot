*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

*** Variables ***
${TIMEOUT}    10

*** Keywords ***
AjouterElementListeDonnees
  [Documentation]    Ajouter un élément dans une liste de données
    ...    Se connecter avec un compte utilisateur ou admin
    ...    Le site doit être créé et doit contenir la page Liste de données
    ...    L'utilisateur est membre du site
    ...    Un liste de données doit être crée  
    # ${vNom_Site} contient le nom du site 
    # ${vNomListeDonnees} contient la liste de données
    # ${vTitre_Element} contient le titre de l'élément
    # ${vReference} contient la reference
    # ${vHeure_Debut} contient l'heure de début
    # ${vHeure_Fin} contient l'heure de fin
    # ${vNom_Seance} contient le nom de la seance
    # ${vIntervenant} contient l'intervenat
    # ${vAuditoire} contient l'auditoire où se deroulera
    # ${vNotes} contient les notes
    # ${TIMEOUT} contient le délai avant le Timeout
    [Arguments]    ${date}    ${vNom_Site}    ${vNomListeDonnees}    ${vReference}    ${vHeure_Debut}    ${vHeure_Fin}    ${vNom_Seance}    ${vIntervenant}    ${vAuditoire}    ${vNotes}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
    #Cliquer sur l'onglet Sites
    Click Element    ${Div_HeaderMenu} 
    #attendre que l'element Mes sites soit visible
    Wait Until Element Is Visible    ${Lnk_MesSites}  
    #Cliquer sur le lien Mes sites 
    Click Link    ${Lnk_MesSites}
    #Cliquer sur le nom du site
    ${nomSiteAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNom_Site}    ${date}    
    Click Link    ${SiteLinkRacine}${nomSiteAvecDateDuJour}${finalLinkRacine}  
    #Cliquer sur le bouton plus
    #Click Element    ${Span_PlusBtn}  
    #attendre que l'element Listes des donnees soit visible
    Wait Until Element Is Visible    ${Link_ListesDesDonnees} 
    #Cliquer sur Liste des donnees     
    Click Link    ${Link_ListesDesDonnees}
    #Cliquer sur le liste de données
    ${nomListeDonneesAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNomListeDonnees}    ${date}    
    Wait Until Element Is Visible    ${Var_ContainsTextePart1}${nomListeDonneesAvecDateDuJour}${Var_ContainsTextePart2}
    Click Element    ${Var_ContainsTextePart1}${nomListeDonneesAvecDateDuJour}${Var_ContainsTextePart2}
    #Cliquer sur nouvel élément 
    Wait Until Element Is Visible    ${Btn_NouvelElement}
     #Le bouton est inactif pendant une fraction de temps, il faut attendre avant de cliquer
    Sleep    2
    Click Element    ${Btn_NouvelElement}
    #S'assurer que la fenêtre d'ajout de l'élément s'affiche
    Wait Until Element Is Visible    ${Header_CreerElement}
    #vReference
    ${nomReferenceAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vReference}    ${date}    
    Input Text    ${Txt_Reference}    ${nomReferenceAvecDateDuJour}
    #vHeure_Debut
    Input Text    ${Txt_HeurDebut}    ${vHeure_Debut}
    #vHeure_Fin
    Input Text    ${Txt_HeurFin}    ${vHeure_Fin}
    #vNom_Seance
    Input Text    ${Txt_Nom_Seance}    ${vNom_Seance}
    #vIntervenant
    Input Text    ${Txt_Intervenant}    ${vIntervenant}
    #vAuditoire
    Input Text    ${Txt_Auditoire}    ${vAuditoire}
    #vNotes
    Input Text    ${Txt_Notes}    ${vNotes}
    #Cliquer sur le bouton Enregistrer
    Click Button    ${BTn_Enregistrer_Element}
    #Vérification du popup
    Wait Until Element Is Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
    #Vérifier que le événement existe dans la page
    Page Should Contain    ${vReference}    

