package com.example.back_end.model

import org.springframework.data.mongodb.core.mapping.Document
import org.springframework.data.mongodb.core.mapping.FieldType
import org.springframework.data.mongodb.core.mapping.MongoId

@Document("timeOffRequest")
data class TimeOffRequest(
        @MongoId(FieldType.OBJECT_ID)
        val id: String? = null,
        val timeOffType: String? = null,
        val fromDate: String? = null,
        val fromDateType: String? = null,
        val toDate: String? = null,
        val toDateType: String? = null,
        val description: String? = null,
        val userId: String? = null,
        val createDate: String? = null,
        val status: String? = null,
)