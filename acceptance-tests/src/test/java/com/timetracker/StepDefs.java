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
    public void open_home_page(){
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chrome-drivers/chromedriver_mac");
        driver = new ChromeDriver();
        driver.get("http://localhost:3000");
    }

    @Then("I should see \"([^\"]*)\" message")
    public void iShouldSeeMessage(String message){
        Assert.assertEquals(driver.findElement(By.className("App")).getText(),message);
    }
}
