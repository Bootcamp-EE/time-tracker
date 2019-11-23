package com.timetracker.services

import com.timetracker.models.Message
import com.timetracker.repository.MessageRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class MessageService {
    @Autowired
    lateinit var messageRepository: MessageRepository

    fun getMessage():Message {
        messageRepository.save(Message("hello","Hello World"))
        return messageRepository.findAll().first()
    }

}