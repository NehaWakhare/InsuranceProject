package com.crud.service;

import com.crud.entity.User;

public interface AuthService {

    String login(String email, String password);

    User verifyOtp(String email, String otp);

  
}

