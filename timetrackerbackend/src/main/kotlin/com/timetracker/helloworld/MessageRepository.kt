package com.timetracker.helloworld

import com.timetracker.helloworld.Message
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface MessageRepository: CrudRepository<Message, String> {
}   