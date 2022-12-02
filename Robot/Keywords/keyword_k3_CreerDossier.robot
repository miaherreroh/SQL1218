*** Settings ***
Library     String
Library     SeleniumLibrary 
Variables    ../Locators/accueilLocators.py 
Variables    ../Locators/mesFichiersLocators.py  
Resource   ../Keywords/keyword_KhaoulaB_InitDate.robot

*** Keywords ***

Creer un dossier
    [Documentation]    créer un dossier.
    ...    Se connecter avec un compte administrateur ou utilisateur
    ...    si le nom d'element existe le keyword ajoute la date du jour incluent les secondes au nom fournie en argument
    
    # nom contient le nom du dossier
    # titre contient le titre du dossier
    # description contient la description du dossier
    [Arguments]    ${nom}   ${titre}  ${description} 

    # un variable utiliser pour stocker le text à valider lors de la création
    ${TxtConfirmation} =   Catenate    SEPARATOR=  Le dossier '     ${nom}' a été créé

    # Cliquer sur le menu mes fichiers
    Click Element  ${Link_MesFichiers} 
    
    Sleep    2s
    ${Link_Element}    Replace String    ${Link_Element}    ELEMENT    ${nom}
    ${Resultat}    Run Keyword And Return Status    Element Should Be Visible    ${Link_Element}

    # Cliquer sur le menu Créer
    Wait Until Element Is Visible   ${CreerButton} 
    Click Element   ${CreerButton} 
    # Cliquer sur le sous menu Dossier
    Click Element   ${DossierCreation} 

    Wait Until Element Is Visible   ${Modal_Nouveau_Dossier} 
    ${date}    Init Date
    ${nomElementAvecDateDuJour}=   Catenate    SEPARATOR=_    ${nom}    ${date}    

    #Saisir le nom du dossier
    Run Keyword If    ${Resultat}
    ...            Input Text  ${Txt_Nom}    ${nomElementAvecDateDuJour}
    ...    ELSE    Input Text  ${Txt_Nom}    ${nom}

    #Saisir le titre du dossier
    Input Text  ${Txt_Titre}    ${titre} 
    #Saisir la description du dossier
    Input Text  ${Txt_Description}    ${description} 
    #Cliquer sur le button enregistrer
    Click Button    ${Btn_Enregister}
    
    Sleep    2s
    #Vérification de message de confirmation
    Run Keyword If    ${Resultat} 
    ...    Remplacer text lien element et verifier creation    ${nomElementAvecDateDuJour}   
    ...    ELSE      Element Should Be Visible    ${Link_Element}


Remplacer text lien element et verifier creation
    [Arguments]    ${nom} 
     ${vNouveauLinkName}=    Replace String    ${Link_Element}    ELEMENT    ${nom}
      Element Should Be Visible    ${vNouveauLinkName}  