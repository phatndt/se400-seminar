package com.example.back_end.controller

import com.example.back_end.configuration.ApiEntryPoint
import com.example.back_end.entity.TimeOffRequestEntity
import com.example.back_end.service.TimeOffService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController

@RestController
class TimeOffRequestController(@Autowired private val timeOffService: TimeOffService) {
    @RequestMapping(ApiEntryPoint.CREATE_TIME_OFF, method = [RequestMethod.POST])
    fun createTimeOffRequest(@RequestBody timeOffRequestEntity: TimeOffRequestEntity): ResponseEntity<String> {
        val value = timeOffService.create(timeOffRequestEntity)
        return ResponseEntity(value, HttpStatus.OK)
    }

    @RequestMapping(ApiEntryPoint.READ_TIME_OFF_BY_USER_ID, method = [RequestMethod.POST])
    fun readTimeOffByUserId(@RequestBody map: Map<String, String>): ResponseEntity<List<TimeOffRequestEntity>> {
        val value = map["userId"]?.let { timeOffService.findTimeOffRequestsByUserId(userId = it) }
        return ResponseEntity(value, HttpStatus.OK)
    }
    @RequestMapping(ApiEntryPoint.READ_TIME_OFF, method = [RequestMethod.POST])
    fun readAllTimeOff(): ResponseEntity<List<TimeOffRequestEntity>> {
        val value = timeOffService.findTimeOffRequests()
        return ResponseEntity(value, HttpStatus.OK)
    }
}