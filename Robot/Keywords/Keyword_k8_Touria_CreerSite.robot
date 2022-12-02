*** Settings ***
Library    SeleniumLibrary    
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py

*** Keywords ***
creer nouveau site2
#${nom} represente le nom du site
#${nom-url} represente le nom de l'url
#${description} represente le champs description
#${visibility} represente le Visibilité du site à creer
#Pour visibilite "Public" ecrire en majuscule: PUBLIC
#Pour visibilite "Modere" ecrire en majuscule: MODERATED
#Pour visibilite "Liste privee" ecrire en majuscule: PRIVATE

#${Vcomposant} represente le type du composant à ajouter au site
#Pour le composant 'Wiki' ecrire en majuscule: WIKI
#Pour le composant 'Calendrier' ecrire en majuscule: CALENDRIER
#Pour le composant 'Discussions' ecrire en majuscule: DISCUSSIONS
#Pour le composant 'Calendrier' ecrire en majuscule: CALENDRIER
#Pour le composant 'Blog' ecrire en majuscule: BLOG
#Pour le composant 'Liens' ecrire en majuscule: LIENS
#Pour le composant 'Listes de données' ecrire en majuscule: LISTES DE DONEES

    [Arguments]    ${nom}    ${date}    ${description_Site}    ${visibility}         
#Cliquer sur le lien Sites  
    Click Element    ${Lst_Sites} 
#Cliquer sur le lien creer un site
    Wait Until Element Is Visible    ${Link_CreerSite} 
    Click Element    ${Link_CreerSite}
    Page Should Contain    Créer un site     
#Remplir le formulaire
#Saisir le nom du site 
    ${nomElementAvecDateDuJour}=   Catenate    SEPARATOR=_    ${nom}    ${date}    
    Input Text    ${txt_Nom_Site}    ${nomElementAvecDateDuJour}
#Saisir le non de l'url
#    Clear Element Text    ${txt_NomUrl}
#   Input Text    ${txt_NomUrl}    ${nom-url}    
#Saisir une description
    Input Text    ${txt_description_site}    ${description_Site}  
#cocher la visibilité
    Run Keyword If    ${visibility}=='PUBLIC'    Click Element    ${visibility_public}
    Run Keyword If    ${visibility}=='MODERATED'    Click Element    ${visibility_modere}    
    Run Keyword If    ${visibility}=='PRIVATE'    Click Element    ${visibility_prive}        
#cliquer sur creer
    Sleep    5
    Wait Until Element Is Visible    ${btn_Creer_id}
    Click Element    ${btn_Creer_id}  
   
#verifier que le site est créé
    #Wait Until Element Is Visible    ${SiteLinkRacine}${nom}${finalLinkRacine}
    #Element Should Be Visible    ${SiteLinkRacine}${nom}${finalLinkRacine} 
#Ajout des autres composants

#cliquer sur la roue dentee
    Wait Until Element Is Visible    ${lien_roueDentee}
    Click Element    ${lien_roueDentee}
#cliquer sur personnaliser le site
    Wait Until Element Is Visible    ${Link_PersoSite}
    Click Element    ${Link_PersoSite}
    #deplacer Liens dans le cadran pages du site actuel
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_Liens}     ${Cadran_PageSitActuel}    
#deplacer Listes de donnees dans le cadran pages du site actuel 
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_ListDonnee}     ${Cadran_PageSitActuel}
#deplacer wiki dans le cadran pages du site actuel
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_Wiki}     ${Cadran_PageSitActuel}   
#deplacer Calendrier dans le cadran pages du site actuel
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_Calend}     ${Cadran_PageSitActuel}  
#deplacer Discussions dans le cadran pages du site actuel
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_Discuss}     ${Cadran_PageSitActuel}  
#deplacer Blog dans le cadran pages du site actuel
    Wait Until Keyword Succeeds    5    2    Drag and Drop     ${Icone_Blog}     ${Cadran_PageSitActuel}  
     
#cliquer sur le bouton ok
    Wait Until Element Is Visible    ${Boutton_Ok}
    Click Button     ${Boutton_Ok}
#retour à la page accueil
    Sleep    5
    Wait Until Element Is Visible    ${Link_Accueil}
    Click Element    ${Link_Accueil} 