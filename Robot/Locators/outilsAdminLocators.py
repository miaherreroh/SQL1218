#Page Outils Admin
##Sous-Menu Outils
Link_GestionnaireDeTags = "css:[href=\"tag-management\"]"
Link_GestionnairesDeModele = "css:[href=\"custom-model-manager\"]"
Link_GestionnairesDeSites = "css:[href=\"manage-sites\"]"
##Sous-Menu Utilisateurs et groupes
Link_Groupes = "css:[href=\"groups\"]"
Link_Utilisateurs = "css:[href=\"users\"]"

##Page Outils Admin - Groupes
Txt_RechercheGroupes = "css:[class=\"search-text\"]"
Btn_RechercheGroupes = "xpath://span[@class=\"first-child\"]/button[text()=\"Rechercher\"]"
Btn_ParcourirGroupes = "xpath://span[@class=\"first-child\"]/button[text()=\"Parcourir\"]"
Table_Resultats = "id:page_x002e_ctool_x002e_admin-console_x0023_default-datatable"
ResultatsWebElements = "xpath://table[@id='page_x002e_ctool_x002e_admin-console_x0023_default-datatable']/tbody/tr"
ResultatsRangeeWebElements = "xpath://table[@id='page_x002e_ctool_x002e_admin-console_x0023_default-datatable']/tbody/tr"
MiseAJourIcone = "xpath://a[@class='update']"
IdentifiantGroupeText = "xpath://td[1]/div"

###Page Outils Admin - Groupes - Parcourir Groupes
Btn_CreerGroupe = "css:[class=\"groups-newgroup-button\"]"
Lst_ResultatsGroupes = "xpath://a/span"
txt_messageDeConfirmation = "id:message"

####Page Outils Admin - Groupes - Parcourir Groupes - Nouveau Groupe
Txt_NouveauGroupeId = "xpath:(//div[@class=\"create-main\"]/div/input)[1]"
Txt_NouveauGroupeNomAffiche = "xpath:(//div[@class=\"create-main\"]/div/input)[2]"
Btn_CreerNouveauGroupe = "xpath://button[text()=\"Créer un groupe\"]"

#bouton Creer un modele
CreerModeleBouton = "xpath://span[contains (text(),'Créer') or contains (text(),'Create')]"
#formulaire pour creer un modele
#saisir Espace de nom
EspaceNomTexte = "name=namespace"
#saisir Prefixe
PrefixeModeleTexte = "name=prefix"
#saisir Nom pour le modele
NomModeleTexte = "name=name"
#saisit Description
DescriptionModeleTexte = "//div[@class='control']/textarea"
#bouton Creer
BoutonCreer_Modele = "id=CMM_CREATE_MODEL_DIALOG_OK_label"
#Menu deroulante Actions
link_ActionMenuPart1 = "xpath=//span[text()='"
link_ActionMenuPart2 = "']/ancestor::tr/td[4]//span[text()='Actions']"
#options menu Actions
link_ActionOptionPart1="//body/div/div/div/div/table/tbody/tr/td[text()='"
link_ActionOptionPart2="' or text()='"
link_ActionOptionPart3="']"

#element Supprimer
SupprimerModele = "xpath://tr[@title='Supprimer' or @title='Delete']/td/img[@tabindex='0']"
#Confirmation Supprimer modele
ConfirmationSupprimerModele1 = "//div[@class='footer']/span/span/span/span[text()='"
ConfirmationSupprimerModele2 = "' or text()='"
ConfirmationSupprimerModele3 = "']"
ListeNomModeles = "xpath=//div[@class='alfresco-lists-views-AlfListView bordered']/table"

##Page Outils Admin - Gestionnaire de modele
ClickModeleK2 = "xpath://span[text()='modeleK2']"
localisateurModele1 = "xpath://span/span/span[text()='"   
localisateurModele2 = "']"
ClickConfirmation = "id:CMM_CREATE_PROPERTYGROUP_DIALOG_OK_label"
NouvelAspect_Racine1 = "xpath://span[contains(text(),'" 
NouvelAspect_Racine2 = "')]"
ClickActions = "id:uniqName_0_12"
ClickSupprimer = "id:alfresco_menus_AlfMenuItem___b483eb36-2822-4745-8747-e3f799dfe7ad"
CreerAspectK2 = "xpath://span[text()='Créer un aspect']"
DivObscurateur = "id:alfresco-lists-AlfList__views rendered-view"
Btn_Creer_typePersonnalise = "xpath://div[@class='alfresco-layout-LeftAndRight__left']/span/span/span/span[text()='Créer un type personnalisé']"
# BtnSupprimerFenetreSupprimerAspect: "id:alfresco_buttons_AlfButton___006d4cfb-4ed7-4683-86ff-78903f8442ef_label"

##Page Outils Admin - Creer un aspect
InputNewAspect = "name:name"
DeletedAspect = "xpath://span[text()='K2:test2']"
InputNewAspect = "name:name"
InputNewLibAffichage= "name:title"
InputNewDescription = "xpath://div[2]/div/textarea"
Link_ActionMenuPart1="//span[text()='"
Link_ActionMenuPart2="']/ancestor::tr/td[5]//span[text()='Actions']"
# ActionSupprimer = "//span[text()='K2:AspectK2']/ancestor::tr/td[5]//span[text()='Supprimer']"
ConteneurModele = "//*[@id='dijit_layout_ContentPane_1']"
link_ActionOptionPart1="//body/div/div/div/div/table/tbody/tr/td[text()='Supprimer']"
boutonSupprimer = "xpath://span[text()='Supprimer']"
##Page Outils Admin - Creer type personnalisé
Txt_Nom_TypePerso = "xpath://div/div/div/div/input[@name='name']"
Txt_Libelle_Affichage = "xpath://div/div/div/div/input[@name='title']"
Header_Creer_typePerso = "xpath://div/div/span[@class='dijitDialogTitle']"
Btn_Creer_TypePerso = "id:CMM_CREATE_TYPE_DIALOG_OK_label"
Link_Racine_type1 = "xpath://span/span[contains(text(),'"
Link_Racine_type2 = "')]"
Link_Actions_TypePerso1 = "xpath://span[contains(text(),'"
Link_Actions_TypePerso2 = "')]/ancestor::tr/td[5]//span[text()='Actions']"
Link_Propiete_Ancestor = "')]/ancestor::tr/td[7]//span[@class='alfresco-menus-AlfMenuBarPopup__text-wrapper']"
Link_Concepteur_Dispo = "xpath://div[@class='dijitPopup Popup']//table/tbody[@class='dijitReset']/tr/td[text()='Concepteur de disposition']"
Link_Creer_Propiete = "xpath://span[@class='dijitReset dijitInline dijitIcon inlinePropertyButtonIcon']"
Btn_Creer_Propiete = "xpath://span/span[text()='Créer une propriété']"
Link_Propiete_Cree1 = "xpath://td/span/span/span[contains(text(),'"
Link_Propiete_Cree2 = "')]"
Header_Creer_Propiet = "id:CMM_CREATE_PROPERTY_DIALOG"
Btn_CreerPropiet2 = "id:CMM_CREATE_PROPERTY_DIALOG_CREATE_label"
Link_Supprimer_Propiet = "xpath://div[@class='dijitPopup Popup']//table/tbody[@class='dijitReset']/tr/td[text()='Supprimer']"
Btn_Supprimer_Propiet = "xpath://div[@class='dijitDialogPaneContent']/div/span/span/span[@class='dijitReset dijitStretch dijitButtonContents']/span[text()='Supprimer']"
