*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/mesSitesLocators.py

*** Variables ***
${TIMEOUT}    10

*** Keywords ***
Créer une liste de données
    [Documentation]    Créer une liste de données dans un site
    ...    Se connecter avec un compte
    ...    Le site doit être créé et doit contenir la page Liste de données
    ...    L'utilisateur est membre du site 
    #${vSiteRecherche} contient le nom du site 
    #${Texte_Titre} contient le titre de la liste
    #${Texte_Description} contient la description de la liste
    #${TIMEOUT} contient le délai avant le Timeout
    [Arguments]    ${vNom_Site}    ${date}    ${vNomListeDonnees}    ${Texte_Description} 
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
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
    #Cliquer sur le bouton Nouvelle liste
    Click Button    ${Btn_NouvelleListe}      
    #attendre que l'element Agenda d'evenement soit visible
    Wait Until Element Is Visible    ${Link_AgendaDenvenement}    
    #cliquer sur le lien Agenda d'evenement
    Click Link    ${Link_AgendaDenvenement}   
    #Saisir le Titre 
    ${nomListeDonneesAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNomListeDonnees}    ${date}    
    Input Text    ${Txt_Titre}    ${nomListeDonneesAvecDateDuJour} 
    #Saisir la description
    Input Text    ${Txt_Description_listeDonnes}    ${Texte_Description}    
    #Cliquer sur le bouton Enregistrer
    Click Button    ${Btn_Enregistrer_ListeDonnes}    
    #attendre que l'element Agenda d'evenement soit visible
    Wait Until Element Is Visible    ${Var_ContainsTextePart1}${nomListeDonneesAvecDateDuJour}${Var_ContainsTextePart2}
    #Valider que la liste de donnes a ete cree
    Element Should Contain    ${Lst_ListeDesDonnees}    ${nomListeDonneesAvecDateDuJour}
    #Retourner sur la page d'accueil
    Sleep    5
    Click Element    ${Link_Accueil}     