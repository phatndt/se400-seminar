package com.example.back_end.configuration;

public class ApiEntryPoint {
    public static final String API_VERSION = "/v1";
    public static final String TIME_OFF = API_VERSION + "/timeOff";
    public static final String CREATE_TIME_OFF = TIME_OFF + "/create";
    public static final String READ_TIME_OFF_BY_USER_ID = TIME_OFF + "/readByUserId";

    public static final String READ_TIME_OFF = TIME_OFF + "/read";
//    public static final String AUTHENTICATION = API_VERSION + "/authentication";
//    public static final String LOGIN = AUTHENTICATION + "/login";
//    public static final String REGISTER = AUTHENTICATION + "/register";
//    public static final String ACCOUNT = AUTHENTICATION + "/account";
//    public static final String EMAIL = AUTHENTICATION + "/email";
//    public static final String GET_USER_BY_USER_ID = AUTHENTICATION + "/getUserByUserId";
//    public static final String GET_USER = AUTHENTICATION + "/getUser";
//
//    public static final String USER = AUTHENTICATION + "/user";
//
//    public static final String GET_ALL_USER = USER + "/getAll";
//    public static final String SEND_VERIFICATION_EMAIL = USER + "/sendEmail";
//
//    public static final String SET_VERIFICATION_USER = USER + "/verification/set";
//    public static final String CHANGE_AVATAR_PATH = USER + "/changeAvatarPath";
//    public static final String CHANGE_USERNAME = USER + "/changeUsername";
//    public static final String CHANGE_ADDRESS = USER + "/changeAddress";
//
//    //verification
//    public static final String VERIFICATION = AUTHENTICATION + "/verification";
//    public static final String GET_VERIFICATION_BY_USER = VERIFICATION + "/getVerificationByUser";
//    public static final String GET_VERIFICATION_BY_ID= VERIFICATION + "/getVerificationById";
//    public static final String CREATE_VERIFICATION = VERIFICATION + "/createVerification";
//
//    public static final String SET_VERIFICATION_CODE = VERIFICATION + "/setVerifiedCode";
//
//    //Profile
//    public static final String PROFILE = API_VERSION + "/profile";
//    public static final String PROFILE_CHANGE_PASSWORD = PROFILE + "/changePassword";

}
