package com.example.bai_2.service;

import com.example.bai_2.model.User;

import java.util.List;

public interface IUserService {
    List<User> showList();
    void updateUser(int id, User user);
    void deleteUser(int id);
}
