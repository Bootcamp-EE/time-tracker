package com.timetracker

import io.cucumber.junit.Cucumber
import io.cucumber.junit.CucumberOptions
import org.junit.runner.RunWith

@CucumberOptions(
        features = ["src/test/java/features"],
        glue = ["com.timetracker"]
)
@RunWith(Cucumber::class)
class RunCukesTest