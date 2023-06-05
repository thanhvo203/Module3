package com.example.bai_1.service;

import com.example.bai_1.model.User;
import com.example.bai_1.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public void updateUser(int id, User user) {
         userRepository.updateUser(id,user);
    }

    @Override
    public void deleteUser(int id) {
       userRepository.deleteUser(id);
    }
}
