package com.timetracker;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;

public class StepDefs {
    public static WebDriver driver;

    @Given("I open home page")
    public void open_home_page() {
        System.setProperty("webdriver.chrome.driver", getChromeDriver());
        driver = new ChromeDriver();
        driver.get("http://localhost:3000");
    }

    private static String getChromeDriver() {
        final String os = System.getProperty("os.name").toLowerCase();
        if (os.startsWith("linux")) {
            return "src/test/resources/chrome-drivers/chromedriver_linux";
        } else if (os.startsWith("mac")) {
            return "src/test/resources/chrome-drivers/chromedriver_mac";
        }
        throw new UnsupportedOperationException("Unsupported operating system: " + os);
    }

    @Then("I should see \"([^\"]*)\" message")
    public void iShouldSeeMessage(String message) {
        Assert.assertEquals(driver.findElement(By.className("App")).getText(), message);
    }
}
