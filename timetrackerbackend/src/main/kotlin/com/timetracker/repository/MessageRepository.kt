package com.timetracker.repository

import com.timetracker.models.Message
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface MessageRepository: CrudRepository<Message, String> {
}   