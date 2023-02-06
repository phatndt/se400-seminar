package com.example.back_end

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@SpringBootApplication
class BackEndApplication {
    @RequestMapping("/")
    fun index(): String? {
        return "index"
    }
}

fun main(args: Array<String>) {
    runApplication<BackEndApplication>(*args)
}
