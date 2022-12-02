*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py
*** Variables ***
${TIMEOUT}    10

*** Keywords ***
Créer un lien (dans un site déjà créé)
    [Documentation]    
    ...    Se connecter sur làpplication Alfresco avec un compte adminstrateur ou utilisateur 
    ...    Créer un site et le personaliser  
    
    #titre : contien le titre de lien qu'on va le créer
    #lien_url : contiens le url du lien
    #nom_du_site : contien le nom du site
    #Description : contien la discription du lien
    
    [Arguments]    ${date}    ${nom_du_site}    ${titre}    ${Description}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #Cliquer sur le lien Sites
    Click Element    ${Div_HeaderMenu}
    #Cliquer sur le lien Recherche de sites
    Wait Until Element Is Visible    ${Link_RechercherSite} 
    Click Link    ${Link_RechercherSite}
    ${nomElementAvecDateDuJour}=   Catenate    SEPARATOR=_    ${nom_du_site}    ${date}    
    Input Text    ${Txt_Rechercher_des_site}    ${nomElementAvecDateDuJour}
    Sleep    5
    #Cliquer sur Rechercher button 
    Click Button    ${Rechercher_button} 
    Sleep    5
    #Cliquer sur le nom du site'
    Wait Until Element Is Visible    ${SiteLinkRacine}${nomElementAvecDateDuJour}${finalLinkRacine}       
    Click Link    ${SiteLinkRacine}${nom_du_site}${finalLinkRacine}
    #Cliquer sur la list plus
    Run Keyword And Ignore Error    Click Element    ${Span_PlusBtn}                         
    #Cliquer sur le lien liens
    Wait Until Element Is Visible    ${Lnk_Liens}
    Click Element    ${Lnk_Liens}    
    #Cliquer sur le button Nouveau lien    
    Wait Until Element Is Visible    ${Nouveau_lienButton}
    Click Button    ${Nouveau_lienButton}       
    #Saisir le titre de lien
    ${titreAvecDateDuJour}=   Catenate    SEPARATOR=_    ${titre}    ${date}    
    Input Text    ${Txt_titreButton}    ${titreAvecDateDuJour} 
    #Saisir le url de lien
    ${urlAvecDateDuJour}=   Catenate    SEPARATOR=_    url    ${date}    
    Input Text    ${Lien_urlButton}    ${urlAvecDateDuJour}
    #Saisir la discription du lien
    Input Text    ${Txt_Description_Lien}    ${Description}       
    #Cliquer sur le button Enregistrer     
    Click Button    ${Btn_Enrgistrer_lien}   
    Sleep    5
    #Fermer la navigateur
    # Close All Browsers 