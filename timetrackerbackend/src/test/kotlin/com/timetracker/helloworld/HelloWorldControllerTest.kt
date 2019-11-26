package com.timetracker.helloworld

import com.nhaarman.mockito_kotlin.doReturn

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

@ExtendWith(MockitoExtension::class)
internal class HelloWorldControllerTest {

    @InjectMocks
    lateinit var helloController: HelloWorldController

    @Mock
    lateinit var service: MessageService

    @Test
    fun testHelloWorld() {
        doReturn(Message("hello", "Hello World")).`when`(service).getMessage()

        val result = helloController.index()
        assertNotNull(result)
        assertEquals("Hello World", result.message)
    }
}