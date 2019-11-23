package com.timetracker.models

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document

@Document data class Message(@Id val id:String?=null, val message:String)