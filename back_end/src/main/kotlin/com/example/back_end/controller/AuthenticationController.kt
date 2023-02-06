package com.example.back_end.controller


class AuthenticationController  {

//@RestController
//class AuthenticationController(
//        @Autowired private val authenticationManager: AuthenticationManager,
//        @Autowired private val jwtTokenUtil: JwtTokenUtil,
//        @Autowired private val authenticationService: AuthenticationService
//) {
//
////
////    @Autowired
////    fun setUserDetailsService(userDetailsService: com.example.bookexchangebackend.service.UserDetailsService?) {
////        this.userDetailsService = userDetailsService
////    }
//
//    @RequestMapping(value = [ApiEntryPoint.LOGIN], method = [RequestMethod.POST])
//    fun login(@RequestBody authenticationRequest: LoginRequest): ResponseEntity<ApiResponse<String>> {
//        return try {
//            val user = authenticationService.loadUserByUsername(authenticationRequest.username)
//            handleValidateAuthentication(authenticationRequest, userDetails)
//        } catch (usernameNotFoundException: UsernameNotFoundException) {
//            ResponseEntity(
//                    ApiResponse(
//                            "Wrong username or password",
//                            HttpStatus.NOT_FOUND.value(),
//                            ApiMessage.LOGIN_FAIL),
//                    HttpStatus.NOT_FOUND
//            )
//        }
//    }
//
//    private fun handleValidateAuthentication(authenticationRequest: JwtRequest, userDetails: UserDetailImpl): ResponseEntity<ApiResponse<String>> {
//        return try {
//            validateAuthentication(authenticationRequest.getUsername(), authenticationRequest.getPassword())
//            if (userDetails.isEnabled()) {
//                val token = jwtTokenUtil.generateToken(userDetails)
//                ResponseEntity(
//                        ApiResponse(
//                                JwtResponse(token, userDetails.getUser()),
//                                HttpStatus.OK.value(),
//                                ApiMessage.LOGIN_SUCCESS),
//                        HttpStatus.OK
//                )
//            } else {
//                ResponseEntity(
//                        ApiResponse(
//                                JwtResponse("", User()),
//                                HttpStatus.NOT_FOUND.value(),
//                                ApiMessage.LOGIN_ENABLED),
//                        HttpStatus.NOT_FOUND
//                )
//            }
//        } catch (e: BadCredentialsException) {
//            ResponseEntity(
//                    ApiResponse(
//                            JwtResponse("", User()),
//                            HttpStatus.NOT_FOUND.value(),
//                            ApiMessage.LOGIN_FAIL),
//                    HttpStatus.NOT_FOUND
//            )
//        }
//    }
//
//    @Throws(BadCredentialsException::class)
//    private fun validateAuthentication(username: String, password: String) {
//        val usernamePasswordAuthenticationToken = UsernamePasswordAuthenticationToken(username, password)
//        try {
//            authenticationManager.authenticate(usernamePasswordAuthenticationToken)
//        } catch (e: BadCredentialsException) {
//            throw BadCredentialsException(ApiMessage.LOGIN_FAIL)
//        }
//    }
//
}