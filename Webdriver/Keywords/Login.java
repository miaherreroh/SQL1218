package Keywords;

import java.io.IOException;
import java.time.Instant;
import java.util.Properties;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Login {

	private WebDriver driver;
	private Properties propertiesFile ;
	private WebDriverWait wait;
	private final int timeOut = 10;

	public Login(WebDriver driver, Properties propertiesFile) {
		this.driver = driver;
		this.propertiesFile = propertiesFile;
	}

	public void Keyword_Login(String Url, String vUsername, String vPassword) throws IOException, InterruptedException{
		// Recuperer le valeurs des locators apartir le fichier des properties
		String txt_UserName = propertiesFile.getProperty("txt_UserName");
		String txt_Password = propertiesFile.getProperty("txt_Password");
		String btn_Login = propertiesFile.getProperty("btn_Login");

		driver.get(Url);
		driver.manage().timeouts();
		wait = new WebDriverWait(driver, timeOut);
		wait.until(ExpectedConditions.titleContains("Alfresco » Connexion"));
		driver.findElement(By.name(txt_UserName)).sendKeys(vUsername);
		driver.findElement(By.name(txt_Password)).sendKeys(vPassword);
		driver.findElement(By.id(btn_Login)).click();
		// faire une assertion
		wait.until(ExpectedConditions.titleContains("Alfresco » Tableau de bord utilisateur"));
	}
	
	public void Keyword_Logout() throws InterruptedException {
		// Recuperer le valeurs des locators apartir le fichier des properties
		String menuProfile = propertiesFile.getProperty("Menu_Profile");
		String menuDeconnexion = propertiesFile.getProperty("Menu_Deconnexion");

		driver.findElement(By.id(menuProfile)).click();
		driver.findElement(By.id(menuDeconnexion)).click();
		
		// faire une assertion
		wait = new WebDriverWait(driver, timeOut);
		wait.until(ExpectedConditions.titleContains("Alfresco » Connexion"));
	}
}
