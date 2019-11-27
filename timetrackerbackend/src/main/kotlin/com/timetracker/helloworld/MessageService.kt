package com.timetracker.helloworld

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class MessageService {
    @Autowired
    lateinit var messageRepository: MessageRepository

    fun getMessage(): Message {
        messageRepository.save(Message("hello", "Hello, world!"))
        return messageRepository.findAll().first()
    }
}