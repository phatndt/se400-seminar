package com.example.back_end.model

data class ApiResponse<T>(val value: T, val message: String)
