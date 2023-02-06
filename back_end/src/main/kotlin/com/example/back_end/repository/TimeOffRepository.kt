package com.example.back_end.repository

import com.example.back_end.model.TimeOffRequest
import org.springframework.data.mongodb.repository.MongoRepository

interface TimeOffRepository: MongoRepository<TimeOffRequest, Long> {
}