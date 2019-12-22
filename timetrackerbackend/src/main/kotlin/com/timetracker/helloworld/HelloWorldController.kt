package com.timetracker.helloworld

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@CrossOrigin
@RestController
class HelloWorldController {

    @Autowired
    lateinit var messageService: MessageService

    @GetMapping("/hello")
    fun index(): Message {
        return messageService.getMessage()
    }
}