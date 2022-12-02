*** Settings ***
Library    SeleniumLibrary
Library    DateTime    
Library    String    

Variables    ../Locators/accueilLocators.py    
Variables    ../Locators/outilsAdminLocators.py

*** Variables ***
${TIMEOUT}=    5s
*** Keywords ***
	
Creer modele
    [Documentation]    créer le modele
    ...    se connecter avec un compte
    #${vTexteModeleEspaceNom} contient l'espace de nom du modèle
    #${vTexteModelePrefixe}contient le prefixe du modèle
    #${vTexteModeleNom} contient le nom du modèle
    #${vTexteModeleDescription}contient la description du modèle
    [Arguments]    ${vTexteModeleEspaceNom}    ${vTexteModelePrefixe}    ${vTexteModeleNom}    ${vTexteModeleDescription}    ${date}
    #cliquer sur le lien Outils admin
    Click Element    ${Link_OutilsAdmin}
    #cliquer sur le lien Gestionnaire de modeles
    Click Link    ${Link_GestionnairesDeModele}
    #ajout la date pour rendre le nom unique
    ${vTexteModeleNom}=    Catenate    ${vTexteModeleNom}${date}
    #cliquer sur le bouton Creer un modele
    Click Element    ${CreerModeleBouton}
    #saisir espace de nom
    Input Text    ${EspaceNomTexte}    ${vTexteModeleEspaceNom}
    #saisir le prefixe
    Input Text    ${PrefixeModeleTexte}    ${vTexteModelePrefixe} 
    #saisir le nom
    Input Text    ${NomModeleTexte}    ${vTexteModeleNom}
    #saisir description
    Input Text    ${DescriptionModeleTexte}    ${vTexteModeleDescription}    
    #cliquer sur le bouton Creer
    Click Element    ${BoutonCreer_Modele}
    Sleep    2  
    #S'assurer que le modele ete cree    
    Page Should Contain    ${vTexteModeleNom}
    Sleep    2    
    #retourner a la page Accueil
    Click Element   ${Link_Accueil} 
    