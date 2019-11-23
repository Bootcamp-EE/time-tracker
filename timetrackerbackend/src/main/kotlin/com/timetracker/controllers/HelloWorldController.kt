package com.timetracker.controllers

import com.timetracker.models.Message
import com.timetracker.services.MessageService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldController {

    @Autowired
    lateinit var messageService: MessageService

    @GetMapping("/")
    fun index():Message {
        return messageService.getMessage()
    }
}