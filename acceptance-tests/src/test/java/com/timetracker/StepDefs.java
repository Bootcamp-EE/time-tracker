package com.timetracker;

import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.Map;

import static java.lang.Runtime.getRuntime;
import static java.lang.System.getProperty;
import static java.lang.System.setProperty;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class StepDefs {
    private static final String CHROME_DRIVER_PATH = "src/test/resources/chrome-drivers/";
    private static final Map<String, String> chromeDrivers = Map.of(
            "Linux", "chromedriver_linux",
            "Mac OS X", "chromedriver_mac",
            "Windows", "chromedriver.exe" // TODO Verify map key on a Windows 10 machine
    );
    public static WebDriver driver;

    private static String getChromeDriver() {
        return CHROME_DRIVER_PATH + chromeDrivers.getOrDefault(
                getProperty("os.name"),
                "OS Not Supported. Add chrome driver to " + CHROME_DRIVER_PATH + " and make an entry in chromeDrivers in this class."
        );
    }

    @Before
    public void initWebDriver() {
        if (driver != null) return;
        setProperty("webdriver.chrome.driver", getChromeDriver());
        driver = new ChromeDriver();
        getRuntime().addShutdownHook(new Thread(driver::quit));
    }

    @Given("I open the home page")
    public void open_home_page() {
        driver.get("http://localhost:3000");
    }

    @Then("I MUST see a message {string}")
    public void iMustSeeMessage(String message) {
        assertEquals(driver.findElement(By.className("App")).getText(), message);
    }
}
