package Keywords;
import Outils.RepositoryParser;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

public class Keyword_Silvia_k4_CreerEvenement {
    protected WebDriver driver;
    private RepositoryParser parser;
    private Properties Locators;
    private int timeOut = 20;
    WebDriverWait wait;

    /**
     * Class constructor.
     *
     * @param webDriver Pilote de navigateur utiliser pour exécuter les tests.
     * @return Rien.
     * @throws IOException Erreur d'entrée
     * @see IOException
     */
    public Keyword_Silvia_k4_CreerEvenement(WebDriver webDriver, Properties locators) throws IOException {
        this.driver = webDriver;
        this.Locators = locators;
        parser = new RepositoryParser("src/main/resources/Locators/Locators_Silvia.properties");
    }

    /**
     * Creer_Evenement keyword method dans un site .
     * Il faut avoir:
     * Un conexion d'utilisateur simple ou admin avec le rôle de gestionnaire du site
     * Un site déjà créé
     * Un site personnalisé où apparait le lien "Calendrier"
     *
     * @param vSite_Nom    contient le nom du site déjà créé.
     * @param vQuoi        contient le nom de l'événement.
     * @param vOu          contient la localisation de l'événement.
     * @param vDescription contient une description.
     * @param vTags        une étiquette pour trier l'évènement.
     * @return Rien.
     * @throws InterruptedException On thread error.
     * @see InterruptedException
     */
    public void keyword_Creer_Evenement(String vSite_Nom, String vQuoi, String vOu, String vDescription, String vTags) {
        Random r = new Random();
        //Cliquer sur le site qui a été dèja crée
        String Website_Racine = Locators.getProperty("SiteLinkRacine");
        String Website_Locator = String.format("%1$s%2$s\"]", Website_Racine, vSite_Nom);
        wait = new WebDriverWait(driver, timeOut);
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(Website_Locator)));
        driver.findElement(By.xpath(Website_Locator)).click();
        //Click sur l’onglet "Calendrier"
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Link_calendrier"))).click();
        //Verifier le nombre de événement nommé tel que le contenu de vQuoi
        String newEvenement = Locators.getProperty("Txt_newEvenement").replace("{{Evenement}}", vQuoi);
        int evenementsCount = driver.findElements(By.xpath(newEvenement)).size();
        //Click sur le button nouvel événement
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Btn_Nouvel_evenement"))).click();
        //Remplir formulaire Ajouter un événement
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Header_Fenetre")));
        //Remplir le formulaire en ajoutant les données suivantes:
        //Quoi
        driver.findElement(parser.getObjectLocator("Txt_quoi")).sendKeys(vQuoi);
        //Où
        driver.findElement(parser.getObjectLocator("Txt_localisation")).sendKeys(vOu);
        //Description
        driver.findElement(parser.getObjectLocator("Txt_description")).sendKeys(vDescription);
        //Journée entière
        driver.findElement(parser.getObjectLocator("CheckBox_journee")).click();
        //Date de début
        driver.findElement(parser.getObjectLocator("Btn_calendrierPicker_D")).click();
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Header_calendrier")));
        int numero_D = r.nextInt(28) + 1;
        String jour_Racine = Locators.getProperty("Btn_calendrier_jour");
        String jour_D_Locator = String.format("%1$s%2$d", jour_Racine, numero_D);
        driver.findElement(By.id(jour_D_Locator)).click();
        //Date de fin
        driver.findElement(parser.getObjectLocator("Btn_calendrierPicker_F")).click();
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Header_calendrier")));
        int numero_F = r.nextInt(28 - numero_D) + numero_D + 1;
        String jour_F_Locator = String.format("%1$s%2$d", jour_Racine, numero_F);
        driver.findElement(By.id(jour_F_Locator)).click();
        //Tags
        driver.findElement(parser.getObjectLocator("Txt_tag")).sendKeys(vTags);
        driver.findElement(parser.getObjectLocator("Btn_Ajout")).click();
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Tag_test")));
        //Verifier que le tag à été ajouté
        driver.findElement(parser.getObjectLocator("Tag_test")).getText().contains(vTags);
        //Click boutton enregistrer
        driver.findElement(parser.getObjectLocator("Btn_enregistrer")).click();
        //Vérifier que l'événement est dans les événements créés
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(newEvenement)));
        if(evenementsCount >= driver.findElements(By.xpath(newEvenement)).size()){
            System.out.println("L'évènement n'été pas ajouté");
        }
        //Revenir à la page accueil
        driver.findElement(parser.getObjectLocator("Link_Accueil")).click();
    }

}
