package com.timetracker

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class TimetrackerApplication

fun main(args: Array<String>) {
	runApplication<TimetrackerApplication>(*args)
}
