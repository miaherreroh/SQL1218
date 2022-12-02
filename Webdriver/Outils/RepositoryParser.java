package Outils;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import org.openqa.selenium.By;

public class RepositoryParser {
    private Properties propertyFile = new Properties();

    public RepositoryParser(String fileName) throws IOException
    {
        FileInputStream stream = new FileInputStream(fileName);
        propertyFile.load(stream);
    }

    public By getObjectLocator(String locatorName)
    {
        String locatorProperty = propertyFile.getProperty(locatorName);
        String locatorType = locatorProperty.split(":")[0];
        String locatorValue = locatorProperty.split(":")[1];

        By locator = null;
        switch(locatorType)
        {
            case "id":
                locator = By.id(locatorValue);
                break;
            case "name":
                locator = By.name(locatorValue);
                break;
            case "css":
                locator = By.cssSelector(locatorValue);
                break;
            case "LinkText":
                locator = By.linkText(locatorValue);
                break;
            case "PartialLinkText":
                locator = By.partialLinkText(locatorValue);
                break;
            case "TagName":
                locator = By.tagName(locatorValue);
                break;
            case "xpath":
                locator = By.xpath(locatorValue);
                break;
        }
        return locator;
    }
}
