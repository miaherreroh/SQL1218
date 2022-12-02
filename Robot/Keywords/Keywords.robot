*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    Collections
Variables    ../Locators/mesSitesLocators.py
Variables    ../Locators/accueilLocators.py
Variables    ../Locators/outilsAdminLocators.py
Variables    ../Locators/mesFichiersLocators.py

*** Variables ***
${TIMEOUT}    10

*** Keywords ***
Ajouter un commentaire à un lien
    [Documentation]
    ...    Pour ajouter un commentaire à un lien
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin
    ...    Un site déjà créé 
    ...    Un lien déjà créé
    # date contient la date courante
    # vNom_du_site contient le nom du site où créer le lien et où va être ajouté le commentaire.
    # vLien contient le nom lien et où va être ajouté le commentaire.
    # vTexte_Commentaire contient le texte du commentaire.
    [Arguments]    ${date}    ${vNom_du_site}    ${vLien}    ${vTexte_Commentaire}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
    #Cliquer sur le lien Sites
    Click Element    ${Div_HeaderMenu}
    #Cliquer sur le lien Recherche de sites
    Wait Until Element Is Visible    ${Link_RechercherSite} 
    Click Link    ${Link_RechercherSite}
    ${nomSiteAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNom_du_site}    ${date}    
    Input Text    ${Txt_Rechercher_des_site}    ${nomSiteAvecDateDuJour}
    Sleep    3
    #Cliquer sur Rechercher button 
    Click Button    ${Rechercher_button} 
    #Cliquer sur le nom du site
    Wait Until Element Is Visible    ${SiteLinkRacine}${nomSiteAvecDateDuJour}${finalLinkRacine}       
    Click Link    ${SiteLinkRacine}${nomSiteAvecDateDuJour}${finalLinkRacine}
    #S'assurer être sur le site créé
    Page Should Contain    ${nomSiteAvecDateDuJour}
    #Cliquer sur l'acces aux liens
    Wait Until Element Is Visible    ${Lnk_Liens}
    Click Element    ${Lnk_Liens}
    #Cliquer sur le nom du lien
    ${nomLienAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vLien}    ${date}    
    Wait Until Element Is Visible    ${Link_Lien_Partie1}${nomLienAvecDateDuJour}${Link_Lien_Partie2}       
    Click Link    ${Link_Lien_Partie1}${nomLienAvecDateDuJour}${Link_Lien_Partie1}
    #S'assurer que le lien s'affiche
    Wait Until Element Is Visible    ${Btn_AjouterComentaire1}    
    #Cliquer sur le boutton Ajouter un commentaire1
    Click Button    ${Btn_AjouterComentaire1}
    #Saisir le commentaire dans le champ de texte
    Input Text    ${Txt_commentaire}    ${vTexte_Commentaire}    
    #Cliquer sur le boutton Ajouter un commentaire2
    Click Button    ${Btn_AjouterComentaire2}
    #S'assurer que le commentaire a été créé
    Element Should Be Visible    ${vTexte_Commentaire}

Déplacer une sélection de fichiers vers
    [Documentation]
    ...    Pour déplacer une sélection de fichiers 
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin 
    ...    Au moins 2 fichiers ajoutés
    # vNomFichiers contient les noms des fichiers à déplacer
    # date contient la date courante
    # vNom_du_site contient le nom du site à deplacer les fichiers

    [Arguments]    ${vNom_du_site}    ${date}    @{vNomFichiers}
# Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
#S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
#Cliquer sur le menu Mes fichiers
    Click Element    ${Link_MesFichiers}
#S'assurer que les fichier sont visibles
    FOR    ${fichier}    IN    @{vNomFichiers}
        ${nomFichierAvecDateDuJour}=   Catenate    SEPARATOR=_    ${fichier}    ${date}    
        Wait Until Element Is Visible    ${Lnk_Checkbox}${nomFichierAvecDateDuJour}${Lnk_Checkbox1}
        Click Element    ${Lnk_Checkbox}${nomFichierAvecDateDuJour}${Lnk_Checkbox1}  
    END
#Cliquer sur le Menu Éléments Sélectionné  
    Click Element    ${Btn_Eléments_sélectionnés}
#Cliquer le lien Deplacer ver
    Wait Until Element Is Visible    ${Lnk_Deplacer_vers}
    Click Element    ${Lnk_Deplacer_vers}
#S'assurer que le lien Toutes mes sites sont affichés
    Wait Until Element Is Visible    ${Lnk_toute_les_sites}
#Cliquer le lien "Toutes mes sites"
    Click Element    ${Lnk_toute_les_sites}
#Rechercher sur la liste de site le site voulu
    Wait Until Element Is Visible    ${Lts_Sites}
#S'assurer que le site voulu est visible
    Scroll Element Into View    ${Lnk_Seleccion_Site1}${vNom_du_site}${Lnk_Seleccion_Site2}
#Cliquer sur le site trouvé
    Click Element    ${Lnk_Seleccion_Site1}${vNom_du_site}${Lnk_Seleccion_Site2}
#Cliquer sur lde bouton Déplacer           
    Click Button    ${Btn_Deplacer}
#S'assurer l'affichage su message de confirmation
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
Ajouter un aspect à un fichier
    [Documentation]
    ...    Pour ajouter un aspect à un fichier
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin 
    
    # date contient la date courante
    # vNomFichier contient le nom du fichier
    # vAspect contiens le nom de l'aspect à ajouter
            
    [Arguments]    ${date}    ${vNomFichier}    ${vAspect}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
    #Cliquer sur le menu Mes fichiers
    Click Element    ${Link_MesFichiers}
    ${nomElementAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNomFichier}    ${date}    
    #S'assurer que les fichier sont visibles
    Wait Until Element Is Visible    ${Lnk_Checkbox}${nomElementAvecDateDuJour}${Lnk_Checkbox1}
    #Cliquer sur le fichier
    Click Element    ${Link_Racine_Fichier1}${nomElementAvecDateDuJour}${Link_Racine_Fichier2}
    #S'assurer être sur la page du fichier 
    Page Should Contain    ${vNomFichier}
    #S'assurer que le lien gérer les aspects s'affiche
    Wait Until Element Is Visible    ${Link_Gerer_Aspect}
    Click Element    ${Link_Gerer_Aspect}
    #S'assurer que la liste est visible
    Wait Until Element Is Visible    ${List_aspects_left}
    Scroll Element Into View    ${Btn_Ajouter_ApectPartie1}${vAspect}${Link_Racine_Aspect}
    #Cliquer sur l'aspect à ajouter
    Click Element    ${Btn_Ajouter_ApectPartie1}${vAspect}${Generique_ancestor_aspect}${Btn_Ajouter_ApectPartie2}
    #S'assurer que l'aspect est ajouté à la colonne droit
    Element Should Contain    ${List_aspect_right}    ${vAspect}
    #Cliquer bouton appliquer les modifications
    Click Button    ${Btn_AppliquerModifications}
    #Vérification du popup
    Wait Until Element Is Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
    
Supprimer un élémént dans une liste de données
    [Documentation]
    ...    Pour supprimer un élémént dans une liste de données
    ...    Il faut avoir:
    ...    Un conexion d'utilisateur simple ou admin 
    ...    Une liste de données doit être créé
    # date contient la date courante
    # vNomFichier contient le nom du fichier
    # vAspect contiens le nom de l'aspect à ajouter
    [Arguments]    ${date}    ${vNom_Site}    ${vNomListeDonnees}    ${vReference}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #S'assurer être sur la page d'accueil
    Click Element    ${Link_Accueil}
    #Cliquer sur le lien Sites
    Click Element    ${Div_HeaderMenu}
    #Cliquer sur le lien Mes sites
    Wait Until Element Is Visible    ${Lnk_MesSites}
    Click Element    ${Lnk_MesSites}
    #Cliquer sur le nom du site
    ${nomSiteAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNom_Site}    ${date}    
    Click Link    ${SiteLinkRacine}${vNom_Site}${finalLinkRacine}
    #Cliquer sur Liste des donnees     
    Click Link    ${Link_ListesDesDonnees}
    #attendre que l'element Agenda d'evenement soit visible
    ${nomListeDonneesAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vNomListeDonnees}    ${date}    
    Wait Until Element Is Visible    ${Var_ContainsTextePart1}${vNomListeDonnees}${Var_ContainsTextePart2}
    Click Element    ${Var_ContainsTextePart1}${nomListeDonneesAvecDateDuJour}${Var_ContainsTextePart2}
    #S'assurer que la fenêtre d'ajout s'affiche
    Wait Until Element Is Visible    ${Header_Reference}
    #Possitionner la souris sur le nom de l'élément à supprimer 
    ${nomReferenceAvecDateDuJour}=   Catenate    SEPARATOR=_    ${vReference}    ${date}    
    Mouse Over    ${Link_Racine_Element1}${nomReferenceAvecDateDuJour}${Link_Racine_Element2}
    Wait Until Element Is Visible    ${Link_Racine_Element1}${nomReferenceAvecDateDuJour}${Link_Racine_Element2}${Ancestor_following_sibling}${Btn_Supprimer_Element}
    #Cliquer sur le bouton supprimer
    Click Element    ${Link_Racine_Element1}${nomReferenceAvecDateDuJour}${Link_Racine_Element2}${Ancestor_following_sibling}${Btn_Supprimer_Element}
    #Cliquer sur le bouton de confirmation de suppression
    Wait Until Element Is Visible    ${Btn_Supprimer_Element_Popup}
    Click Button    ${Btn_Supprimer_Element_Popup}
    #Vérification du popup
    Wait Until Element Is Visible    ${txt_messageDeConfirmation}
    Element Should Be Visible    ${txt_messageDeConfirmation}
    Wait Until Element Is Not Visible    ${txt_messageDeConfirmation}
    #S'assurer que l'élement ne existe pas sur la page
    Page Should Not Contain    ${Link_Racine_Element1}${nomReferenceAvecDateDuJour}${Link_Racine_Element2}



   

