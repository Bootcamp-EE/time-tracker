package com.timetracker

import io.cucumber.java.Before
import io.cucumber.java.en.Given
import io.cucumber.java.en.Then
import org.junit.jupiter.api.Assertions
import org.openqa.selenium.By
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.chrome.ChromeOptions

class StepDefs {
    @Before
    fun initWebDriver() {
        if (driver != null) return
        System.setProperty("webdriver.chrome.driver", chromeDriver)
        val options = ChromeOptions()
        options.addArguments("--headless")
        driver = ChromeDriver(options)
        Runtime.getRuntime().addShutdownHook(Thread(Runnable { (driver as ChromeDriver).quit() }))
    }

    @Given("I open the home page")
    fun open_home_page() {
        driver!!["http://localhost:3000"]
    }

    @Then("I MUST see a message {string}")
    fun iMustSeeMessage(message: String?) {
        Assertions.assertEquals(driver!!.findElement(By.className("App")).text, message)
    }

    companion object {
        private const val CHROME_DRIVER_PATH = "src/test/resources/chrome-drivers/"
        private val chromeDrivers = mapOf(
                "Linux" to "chromedriver_linux",
                "Mac OS X" to "chromedriver_mac",
                "Windows" to "chromedriver.exe" // TODO Verify map key on a Windows 10 machine
        )
        var driver: WebDriver? = null
        private val chromeDriver: String
            get() = CHROME_DRIVER_PATH + chromeDrivers.getOrDefault(
                    System.getProperty("os.name"),
                    "OS Not Supported. Add chrome driver to $CHROME_DRIVER_PATH and make an entry in chromeDrivers in this class."
            )
    }
}