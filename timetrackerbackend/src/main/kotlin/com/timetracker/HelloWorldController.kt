package com.timetracker

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldController {

    @GetMapping("/")
    fun greeting(@RequestParam(value = "name", defaultValue = "World") name: String) =
            "Hello, World"

}