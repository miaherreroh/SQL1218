*** Settings ***
Resource    ../Keywords/keyword_k1_Login.robot
Resource    ../Keywords/keyword_k4_Creer_Evenement.robot
Resource    ../Keywords/keyword_k21_Supprimer_Evenement.robot
Resource    ../Keywords/Keyword_k2_InitDate.robot
Resource    ../Keywords/Keywords.robot
Resource    ../Keywords/Keyword_k3_CreerFichier.robot
Resource    ../Keywords/Keyword_Ajouter_élément_liste de données.robot
Resource    ../Keywords//Keyword_Ajouter_élément_liste de données.robot
##Resource    ../Keywords/Keyword_K10_Creer_TypePersonnalise.robot
##Resource    ../Keywords/Keyword_CreerPropiete_TypePerso.robot

*** Variables ***
${URL}=    http://localhost:8088/share/page/
${Browser}=    chrome
${userlogin}=   admin123
${userpassword}=    Admin123
${siteWeb_Name}=    Campagne de test
${nom_du_site} =    Campagne de test
${titre_lien} =    Lien_Sprint-1
${Description}=    Pour gérer le cas de test
${description_Site} =    Site pour le champagne de test
${visibility} =    'MODERATED'
#${composant} =    'LIENS' 
#${composant}=    'LISTES DE DONEES'
#Paramètres  de la fonction Déplacer une sélection de fichiers vers.
@{nomFichiers} =    Fichier de test automatisé    Automatic file test
#Paramètres  de la fonction creer fichier
${nomFichier} =    Automatisation de test
${titre_fichier} =    Automatisation de test
${description_site} =    Fichier pour les données de l'automatisation de test
#Paramètres  de la fonction Ajouter un commentaire à un lien
${Texte_Commentaire} =    Enregistrer après des changements 
#Paramètres de ajouter un aspect a un fichier
${aspect} =    Catégorisable (cm:generalclassifiable)
#Paramètres Créer une liste de données
${NomListeDonnees} =    Agenda Sprint_1
${Texte_Description} =    Agenda destiné à l'échéancier du sprint_1
#Paramètres pour Ajouter un élément dans un liste de données
${Reference} =    Test Manuels
${Heure_Debut} =    18:00
${Heure_Fin} =     20:00
${Nom_Seance} =    Revision
${Intervenant} =    G_1218 
${Auditoire} =    Teams
${Notes} =    Évènement obligatoire
#Paramètres pour creer un modèle
${TexteModeleEspaceNom} =   Test
${TexteModelePrefixe} =    Mod_T    
${TexteModeleNom} =    Mod
${TexteModeleDescription} =    Modele_Test Campagne de test
#Paramètres pour creer un aspect
${Nom_Aspect} =    Versionnable (cm:versionable)   
${txt_LibAffichage} =    Asp_t      
${txt_Description} =    Aspect pour la champagne de test 
#Paramètres pour creer un type personnalisé
${NomType} =    Type_Perso
${Libelle_Affichage} =    Typ_P 
#Paramètres pour creer un propieté dams un type personnalisé
${NomPropriete} =    Propiet_2022-04-22-191416
@{nomProprietes} =    Propiet1    Propiet2

*** Test Cases ***
Test Create Event    
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    Sleep    2
    Create event    Cas de test    Bois-de-Boulogne    Les cas de test doit être redirigés    test    ${siteWeb_Name}
    Sleep    5
Test Remove Event
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    Sleep    2
    Remove event    Cas de test    ${siteWeb_Name}
    Sleep    5
Test Ajouter un commentaire à un lien
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    ${date}    Init Date
    creer nouveau site2    ${nom_du_site}    ${date}    ${description_Site}    ${visibility}      
    Créer un lien (dans un site déjà créé)    ${date}    ${nom_du_site}    ${titre_lien}    ${Description}
    Ajouter un commentaire à un lien    ${date}    ${nom_du_site}    ${titre_lien}    ${Texte_Commentaire} 
    
Test Déplacer une sélection de fichiers vers
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    ${date}    Init Date
    FOR    ${nomFichier}    IN    @{nomFichiers}
        Creer fichier    10    ${date}    ${nomFichier}    ${titre_fichier}    ${description_site}
    END
    Déplacer une sélection de fichiers vers    ${nom_du_site}    ${date}    @{nomFichiers}

Test Ajouter un aspect à un fichier
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    ${date}    Init Date
    Creer fichier    ${TIMEOUT}    ${date}    ${nom_fichier}    ${titre_fichier}    ${description_site}
    ${nomModeleAvecDateDuJour}=   Catenate    SEPARATOR=_    ${TexteModeleEspaceNom}    ${date}
    Creer modele    ${nomModeleAvecDateDuJour}    ${TexteModelePrefixe}${date}    ${TexteModeleNom}    ${TexteModeleDescription}    ${date}
    # ${nomAspectAvecDateDuJour}=   Catenate    SEPARATOR=_    ${Nom_Aspect}    ${date}
    # ${nomTexteModeleAvecDateDuJour}=   Catenate    ${TexteModeleNom}${date}
    # CreerAspectK2    ${nomTexteModeleAvecDateDuJour}     ${nomAspectAvecDateDuJour}    ${txt_LibAffichage}      ${txt_Description}
    Ajouter un aspect à un Fichier    ${date}    ${nom_fichier}    ${Nom_Aspect}

Test Supprimer un élémént dans une liste de données
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    ${date}    Init Date
    creer nouveau site2    ${nom_du_site}    ${date}    ${description_Site}    ${visibility}      
    Créer une liste de données    ${nom_du_site}    ${date}    ${NomListeDonnees}    ${Texte_Description}
    AjouterElementListeDonnees    ${date}    ${nom_du_site}    ${NomListeDonnees}    ${Reference}    ${Heure_Debut}    ${Heure_Fin}    ${Nom_Seance}    ${Intervenant}    ${Auditoire}    ${Notes}
    Supprimer un élémént dans une liste de données    ${date}    ${nom_du_site}    ${NomListeDonnees}    ${Reference} 

Test Supprimer une propriété d'un type personnalisé
    Login    ${URL}    ${Browser}    ${userlogin}    ${userpassword}
    ${date}    Init Date
    ${nomModeleAvecDateDuJour}=   Catenate    SEPARATOR=_    ${TexteModeleEspaceNom}    ${date}
    Creer modele    ${nomModeleAvecDateDuJour}    ${TexteModelePrefixe}${date}    ${TexteModeleNom}    ${TexteModeleDescription}    ${date}
    ${nomModeleAvecDateDuJour}=   Catenate    SEPARATOR=_    ${TexteModeleEspaceNom}    ${date}
    ${nomTypeAvecDateDuJour}=   Catenate    SEPARATOR=_    ${NomType}    ${date}
    ${nomTexteModeleAvecDateDuJour}=   Catenate    ${TexteModeleNom}${date}
    Creer type personnalise    ${nomTexteModeleAvecDateDuJour}    ${nomTypeAvecDateDuJour}    ${Libelle_Affichage}
    FOR    ${nomPropriete}    IN    @{nomProprietes}
        ${nomPropieteAvecDateDuJour}=   Catenate    SEPARATOR=_    ${nomPropriete}    ${date}
        CreerProprie_typePerso    ${nomTexteModeleAvecDateDuJour}    ${nomTypeAvecDateDuJour}    ${nomPropieteAvecDateDuJour}
    END
    Supprimer des propriétés d'un type personnalisé    ${nomTexteModeleAvecDateDuJour}    ${nomTypeAvecDateDuJour}    ${date}    @{nomProprietes}
