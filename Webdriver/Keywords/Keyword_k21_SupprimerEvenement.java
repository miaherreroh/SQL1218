package Keywords;
import Outils.RepositoryParser;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.util.Properties;

public class Keyword_Silvia_k21_SupprimerEvenement {
    protected WebDriver driver;
    private RepositoryParser parser;
    private Properties Locators;
    private final int timeOut = 20;
    WebDriverWait wait;

    /**
     * Class constructor.
     *
     * @param webDriver Pilote de navigateur utiliser pour exécuter les tests.
     * @return Rien.
     * @throws IOException Erreur d'entrée
     * @see IOException
     */
    public Keyword_Silvia_k21_SupprimerEvenement(WebDriver webDriver, Properties locators) throws IOException {
        this.driver = webDriver;
        this.Locators = locators;
        parser = new RepositoryParser("src/main/resources/Locators/Locators_Silvia.properties");
    }

    /**
     * Keyword Supprimer_Evenement.
     *
     * @param vSite_Nom contient le nom du site déjà créé.
     * @return Rien.
     * @throws InterruptedException Erreur d'entrée.
     * @see InterruptedException
     */
    public void keyword_Supprimer_Evenement(String vSite_Nom, String vQuoi) throws InterruptedException {
        //Cliquer sur le site qui a été dèja crée
        String Website_Racine = Locators.getProperty("SiteLinkRacine");
        String Website_Locator = String.format("%1$s%2$s\"]", Website_Racine, vSite_Nom);
        wait = new WebDriverWait(driver, timeOut);
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(Website_Locator)));
        driver.findElement(By.xpath(Website_Locator)).click();
        //Click sur l’onglet "Calendrier"
        wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Link_calendrier"))).click();
        String newEvenement = Locators.getProperty("Txt_newEvenement").replace("{{Evenement}}", vQuoi);

        try{
            wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(newEvenement)));
            //Verifier le nombre de événement nommé tel que le contenu de vQuoi
            int evenementsCount = driver.findElements(By.xpath(newEvenement)).size();
            //Click sur l'évènement à eliminer
            driver.findElement(By.xpath(newEvenement)).click();
            //S'assurer que s'affiche la fenêtre
            wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Header_fenetre_info_evenement")));
            //Click sur le boutton supprimer
            driver.findElement(parser.getObjectLocator("Btn_supprimer")).click();
            //Un message de confirmation de suppression s'affiche sur l'écran
            wait.until(ExpectedConditions.presenceOfElementLocated(parser.getObjectLocator("Btn_supprimer_confirmation")));
            //Click sur le button supprimer definitivement
            driver.findElement(parser.getObjectLocator("Btn_supprimer_confirmation")).click();
            //Vérifier que l'événement ne se trouve pas dans la liste d'évènements
            if(evenementsCount <= driver.findElements(By.xpath(newEvenement)).size()){
                System.out.println("L'évènement n'été pas supprimé");
            }
        } catch(org.openqa.selenium.TimeoutException e){
            System.out.println("L'évènement \"" +vQuoi+ "\" n'existe pas");
        } catch(Exception ex){
            System.out.println(ex.toString());
        }
        //Revenir sur la page d'accueil
        driver.findElement(parser.getObjectLocator("Link_Accueil")).click();
        //comparer le titre obtenu avec le titre de la page d'accueil
        driver.getTitle().equalsIgnoreCase("Alfresco » Tableau de bord utilisateur");
        Thread.sleep(5000);
    }
}
