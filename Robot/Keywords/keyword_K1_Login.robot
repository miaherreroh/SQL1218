*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/accueilLocators.py

*** Variables ***
${TIMEOUT}    10

*** Keywords ***
Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${Txt_NomUtilisateur}    ${vUsername}
    # Saisie du mot de passe    
    Input text    ${Txt_MotDePasse}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button   ${Btn_Connexion}
    # S'assurer que la page est chargee
    Wait Until Element Is Visible    ${Lbl_Title}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain     ${Lbl_Title}    Tableau de bord de
Logout
    Click Element    ${Link_Utilisateur}    
    # S'assurer que le menu deroulante est chargee
    Wait Until Element Is Visible    ${Lbl_Title}
    Element Should Contain     ${Lbl_Title}    Tableau de bord de
    Sleep    3
    Click Element     ${Link_Logout_MonProfil}   
    Wait Until Element Is Visible    ${Link_PageAcc} 
    Element Should Contain    ${Link_PageAcc}    Alfresco Share
#Close All
    #Close All Browsers



