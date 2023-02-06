package com.example.back_end.entity

import com.example.back_end.model.Status
import com.example.back_end.model.TimeOffRequest
import com.example.back_end.model.TimeOffType
import java.sql.Time

data class TimeOffRequestEntity(
        val id: String? = null,
        val timeOffType: TimeOffType? = null,
        val fromDate: String? = null,
        val fromDateType: String? = null,
        val toDate: String? = null,
        val toDateType: String? = null,
        val description: String? = null,
        val userId: String? = null,
        val createDate: String? = null,
        val status: Status? = null,
)

fun TimeOffRequestEntity.toModel(): TimeOffRequest {
    return TimeOffRequest(id = this.id, timeOffType = this.timeOffType, fromDate = this.fromDate, fromDateType = this.fromDateType, toDate = this.toDate, toDateType = this.toDateType, description = this.description, userId = this.userId, status = this.status)
}