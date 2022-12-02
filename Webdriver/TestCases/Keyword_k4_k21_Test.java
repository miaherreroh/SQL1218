package TestCases;

import Keywords.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;
import java.util.Properties;

public class Keyword_k4_k21_Test {
    public final int TIMEOUT_IN_SECONDS = 5;
    private final static String Base_URL = "http://localhost:8088/share/page/";
    private final static String USERNAME = "mia.herreroh";
    private final static String PASSWORD = "Admin123";

    private final static String Site_Nom = "Campagne de test";
    private final static String Quoi = "Cas de test";
    private final static String Ou = "Bois-de-Boulogne";
    private final static String Description = "Les cas de test doit être redirigés";
    private final static String Tags = "test";

    private WebDriver driver;
    private Properties locators;
    private Login kwLogin;

    @BeforeClass
    private void beforeClass() throws Exception {
        try {
            InputStream propFile = new FileInputStream("src/main/resources/Locators/Locators_Silvia.properties");
            locators = new Properties();
            locators.load(propFile);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        driver = new ChromeDriver();
        login();
    }

    @Test(testName = "Se_loger")
    private void login() throws IOException, InterruptedException {
        driver.get(Base_URL);
        driver.manage().window().maximize();
        kwLogin = new Login(driver, locators);
        kwLogin.Keyword_Login(Base_URL, USERNAME, PASSWORD);
    }

    @Test(testName = "Se déconnecter")
    private void logout() throws InterruptedException {
        kwLogin = new Login(driver, locators);
        kwLogin.Keyword_Logout();
    }

    @Test(testName = "Creer_Evenement")
    public void creerEvenement() throws IOException {
        Keyword_Silvia_k4_CreerEvenement kwCreer = new Keyword_Silvia_k4_CreerEvenement(driver, locators);
        kwCreer.keyword_Creer_Evenement(Site_Nom, Quoi, Ou, Description, Tags);
    }

    @Test(testName = "Supprimer_Evenement")
    public void Supprimer_Evenement() throws IOException, InterruptedException {
        Keyword_Silvia_k21_SupprimerEvenement kwSupprimer = new Keyword_Silvia_k21_SupprimerEvenement(driver, locators);
        kwSupprimer.keyword_Supprimer_Evenement(Site_Nom, Quoi);
    }

    @AfterSuite
    private void cleanUp() throws InterruptedException {
        logout();
        driver.manage().deleteAllCookies();
        driver.close();
    }
}