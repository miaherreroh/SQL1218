import random
#Page Mes Sites

#Localisateur menu sites
Div_HeaderMenu="id=HEADER_SITES_MENU_text"
Lnk_MesSites="xpath=//a[text()='Mes sites']"
Lnk_SiteEquipe1="xpath=//a[text()='SiteEquipe1_G1218']"
Span_PlusBtn="id=HEADER_SITE_MORE_PAGES_text"
Link_ListesDesDonnees="xpath=//a[text()='Listes de données']"
Div_HeaderHome="id=HEADER_HOME"
SiteLinkRacine="xpath=//a[contains(text(),'"
finalLinkRacine = "')]"
Resultat_verification_P1 = "xpath://span/a[text()="
Resultat_verification_P2 = "']"
lien_roueDentee = "id=HEADER_SITE_CONFIGURATION_DROPDOWN"
Link_PersoSite = 'xpath://a[contains(text(),"Personnaliser le site")]'
#Personnaliser le site
Cadran_PageSitActuel = 'xpath://div/ul[@id="template_x002e_customise-pages_x002e_customise-site_x0023_default-currentPages-ul"]'
Icone_Wiki = "id=template_x002e_customise-pages_x002e_customise-site_x0023_default-page-discussions-topiclist"
Icone_Calend = "id=template_x002e_customise-pages_x002e_customise-site_x0023_default-page-calendar"
Icone_Discuss = "id:template_x002e_customise-pages_x002e_customise-site_x0023_default-page-discussions-topiclist"
Icone_Blog = "id=template_x002e_customise-pages_x002e_customise-site_x0023_default-page-blog-postlist"
Icone_Liens = "id:template_x002e_customise-pages_x002e_customise-site_x0023_default-page-links" 
Icone_ListDonnee = "id=template_x002e_customise-pages_x002e_customise-site_x0023_default-page-data-lists"
Boutton_Ok = "id=template_x002e_customise-pages_x002e_customise-site_x0023_default-save-button-button"
#CreerSite
lien_creerSite_id = "id=HEADER_SITES_MENU_CREATE_SITE_text"
txt_Nom_Site = "xpath://div/input[@name='title']"
txt_description_site = "xpath://div/div/textarea[@name='description']" 
#visibility_public
visibility_public = 'xpath://div[@widgetid="CREATE_SITE_FIELD_VISIBILITY_CONTROL_OPTION0_BUTTON"]'
visibility_modere = 'xpath://div[@widgetid="CREATE_SITE_FIELD_VISIBILITY_CONTROL_OPTION1_BUTTON"]'
visibility_prive = 'xpath://div[@widgetid="CREATE_SITE_FIELD_VISIBILITY_CONTROL_OPTION2_BUTTON"]'
btn_Creer_id = 'xpath://span/span[@id="CREATE_SITE_DIALOG_OK"]'

#Liens
Lnk_Liens = "xpath=//span/a[text()='Liens']"
Nouveau_lienButton = "xpath://button[text()='Nouveau lien']"
Txt_titreButton = "xpath://div/div/input[@name='title']" 
Lien_urlButton = "xpath://div/div/input[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-url']"
Txt_Description_Lien = "xpath://div/div/textarea[@name='description']"
Btn_Enrgistrer_lien = "xpath://span/button[contains(text(),'Enregistrer')]"
Link_Lien_Partie1 = "xpath://h3/a[contains(text(),'"
Link_Lien_Partie2 = "')]"
##Commentaire
Btn_AjouterComentaire1 = "xpath://div[@id='template_x002e_comments_x002e_links-view_x0023_default-actions']/span/span/button[text()='Ajouter un commentaire']"
Txt_commentaire = "xpath://div[@id='mceu_37']"
TxtArea_commentaire = "xpath://*[@id='template_x002e_comments_x002e_links-view_x0023_default-add-content']"
IFrame_commentaire = "xpath://*[@id='template_x002e_comments_x002e_links-view_x0023_default-add-content_ifr']"
Btn_AjouterComentaire2 = "id=template_x002e_comments_x002e_links-view_x0023_default-add-submit-button"
#Localisateur_site_header
Link_calendrier= 'xpath://*[@id="HEADER_SITE_CALENDAR_text"]/a'
#menu_calendrier
Btn_Nouvel_evenement= 'xpath=//*[@id="template_x002e_toolbar_x002e_calendar_x0023_default-addEvent-button-button"]'
#Localisateur_fênetre_ajouter_Evenement
Header_Fenetre= "id:eventEditPanel-dialog_h"
Txt_quoi= 'xpath://*[@id="eventEditPanel-title"]'
Txt_localisation= "id:eventEditPanel-location"
Txt_description_evenement= 'xpath://*[@id="eventEditPanel-description"]'
CheckBox_journee= "id:eventEditPanel-allday"
Btn_calendrierPicker_D= 'xpath://*[@id="fd"]'
Btn_calendrierPicker_F= 'xpath://*[@id="td"]'
numero_D = random.randint(1, 28)
Btn_calendrier_jour_D= "id:buttoncalendar_cell{0}".format(numero_D)
numero_F = random.randint(numero_D, 28)
Btn_calendrier_jour_F= "id:buttoncalendar_cell{0}".format(numero_F)
Txt_tag= "id:eventEditPanel-tag-input-field" 
Btn_Ajout= "id:eventEditPanel-add-tag-button-button"
Tag_test='xpath://*[@id="eventEditPanel-onRemoveTag-1"]/a'
Btn_enregistrer= "id:eventEditPanel-ok-button"
#Localisateur_évènement_créé
Link_cas_de_test='xpath://a/div/span[text()="'
#Localisateur_info_évènement
Header_fenetre_info_evenement="id:eventInfoPanel_h"
Btn_supprimer='id:template_x002e_view_x002e_calendar_x0023_defaultContainer-delete-button-button'
Btn_confirmation_supprimer_evenement="id:yui-gen1-button"

#Localisateur page liste des données
Btn_NouvelleListe="xpath://*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newListButton-button']"
Lst_ListeDesDonnees="id=template_x002e_datalists_x002e_data-lists_x0023_default-body"
Txt_Description_listeDonnes = 'xpath://*[@id="template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_description"]'
Btn_Enregistrer_ListeDonnes = 'xpath://*[@id="template_x002e_datalists_x002e_data-lists_x0023_default-newList-form-submit-button"]'
Var_ContainsTextePart1 = "xpath://li/a[contains(text(),'"
Var_ContainsTextePart2 = "')]"
Link_ListesDesDonnees="xpath=//a[text()='Listes de données']"
Btn_NouvelElement = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-newRowButton-button"
##Creer_Element
Txt_Reference = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaRef"
Txt_HeurDebut = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaStartTime"
Txt_HeurFin = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaEndTime"
Txt_Nom_Seance = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaSessionName"
Txt_Intervenant = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaPresenter"
Txt_Auditoire = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaAudience"
Txt_Notes = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow_prop_dl_eventAgendaNotes"
BTn_Enregistrer_Element = "id:template_x002e_toolbar_x002e_data-lists_x0023_default-createRow-form-submit-button"
Link_Racine_Element1 = "xpath://td/div[contains(text(),'"
Link_Racine_Element2 = "')]"
Header_Reference = "xpath://th/div/span/a[text()='Référence']"
Ancestor_following_sibling ="//ancestor::td/following-sibling::td"
Btn_Supprimer_Element = "//div/a[@title='Supprimer']"
Btn_Supprimer_Element_Popup = "xpath://span/button[text()='Supprimer']"
Header_CreerElement = "xpath://div/div[@id='template_x002e_toolbar_x002e_data-lists_x0023_default-createRow-dialogTitle']"

##Localisateur Nouvelle liste
Link_AgendaDenvenement="xpath=//div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-itemTypesContainer']/div[1]/h4/a"
Txt_Titre="xpath://*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_title']"
