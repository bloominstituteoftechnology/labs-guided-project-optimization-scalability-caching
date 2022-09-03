package com.sha.serverside.service;

import com.sha.serverside.model.User;

import java.util.List;

public interface UserService {
    User saveUser(User user);

    User findByUsername(String username);
}
