package com.example.back_end.service

import com.example.back_end.entity.TimeOffRequestEntity

interface TimeOffService {
    fun create(timeOffRequestEntity: TimeOffRequestEntity): String
    fun findTimeOffRequestsByUserId(userId: String): List<TimeOffRequestEntity>
}