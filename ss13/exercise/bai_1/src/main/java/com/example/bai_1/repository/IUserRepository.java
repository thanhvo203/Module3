package com.example.bai_1.repository;



import com.example.bai_1.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showList();
    void updateUser(int id, User user);
    void deleteUser(int id);
}
