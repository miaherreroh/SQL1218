***Settings***
Library     SeleniumLibrary

Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

***Keywords***
CreerAspectK2
# Preconditions
    ## etre connecter avec un compte administrateur
    ## etre sur la page d'accueil suite à la connexion
    # txt_newModel est le modele choisi et txt_newAspect le nom du nouvel aspect a creer
    [Arguments]     ${txt_modele}     ${vNom_Aspect}   ${txt_LibAffichage}      ${txt_Description} 
    # S'assurer que la page est chargee 
    Wait Until Element Is Visible    ${Link_OutilsAdmin}
    #cliquer sur l'onglet "Outils admin"
    Click Element            ${Link_OutilsAdmin}
    #cliquer sur l'outils "Gestionnaire de modèles"
    Click Element      ${Link_GestionnairesDeModele}
    #S'assurer que la page est chargee et contient le Modele choisi
    Wait Until Element Is Visible    ${localisateurModele1}${txt_modele}${localisateurModele2}
    # S'assurer que la page est chargee 
    Sleep   3
    #cliquer sur le modéle choisi
    Click Element       ${localisateurModele1}${txt_modele}${localisateurModele2}
    # S'assurer que la page est chargee 
    Wait Until Element Is Visible    ${CreerAspectK2}  
    #cliquer sur le bouton "Créer un aspect"
    Click Element    ${CreerAspectK2}
    #saisir le Nom du nouvel aspect et les champs à completer
    Input text   ${InputNewAspect}   ${vNom_Aspect} 
    Input text   ${InputNewLibAffichage}   ${txt_LibAffichage}
    Input text   ${InputNewDescription}   ${txt_Description}
    #cliquer sur le bouton "Créer"
    Click Element    ${ClickConfirmation}
    # S'assurer que la page est chargee et contient le nouvel Aspect
    Wait Until Element Is Visible    ${NouvelAspect_Racine1}${vNom_Aspect}${NouvelAspect_Racine2}
    #s'assurer que l'aspect "K2:AspectK2" est visible dans la section Aspect
    #Element Should Contain   ${NouvelAspect_Racine1}${vNom_Aspect}${NouvelAspect_Racine2}  ${txt_newAspect}
    Sleep   3
