*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

*** Variables ***
${TIMEOUT}    10

*** Keywords ***
Creer fichier
  [Documentation]
    ...    Pour creer un fichier
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin 
    ...    Au moins 2 fichiers ajoutés
    # vNomFichier contient le nom du fichier
    # vTitreFichier contient le titre du fichier
    # vDescriptionSite contiens la description du fichier
    
    [Arguments]    ${TIMEOUT}    ${date}    ${vNomFichier}    ${vTitreFichier}    ${vDescriptionSite}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
    #Cliquer sur le menu Mes fichiers
    Click Element    ${Link_MesFichiers}
    #S'assurer être dans mes fichier
    Page Should Contain    Mes fichiers
    # Cliquer sur le menu Créer
    Wait Until Element Is Visible   ${CreerButton} 
    Click Element   ${CreerButton}
    #Cliquer sur le lien Plein texte...
    Click Element    ${PleinTexteCreation}
    #S'assurer être dans l'endroit de creation d'un fichier
    Page Should Contain    Créer un contenu
    #Saisir les données:
    #Nom
    ${nomElementAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNomFichier}    ${date}    
    Input Text    ${Txt_Nom_Fichier}    ${nomElementAvecDateDuJour}
    #Titre
    Input Text    ${Txt_Titre_Fichier}    ${vTitreFichier}
    #Description
    Input Text    ${Txt_Description_Fichier}    ${vDescriptionSite}
    #Cliquer sur le bouton Creer
    Click Button    ${Btn_Creer_Fichier}
    #Vérifier que le événement existe dans la page
    Sleep    2
    Page Should Contain    ${nomElementAvecDateDuJour}
    
