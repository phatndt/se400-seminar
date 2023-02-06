package com.example.back_end.controller

import com.example.back_end.configuration.ApiEntryPoint
import com.example.back_end.entity.TimeOffRequestEntity
import com.example.back_end.model.Status
import com.example.back_end.model.TimeOffType
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
    fun createTimeOffRequest(@RequestBody map: Map<String, String>): ResponseEntity<String> {
        val value = timeOffService.create(TimeOffRequestEntity(null,TimeOffType.ANNUAL, "x", "x", "x", "x", "x", "x", "x", Status.SUBMIT))
        return ResponseEntity(value, HttpStatus.OK)
    }
}