package com.something.service;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {

    public boolean performLogin(String username, String password) {
        if (username.equals("developer") && password.equals("devpassword")) {
            return true;
        }
        return false;
    }
}
