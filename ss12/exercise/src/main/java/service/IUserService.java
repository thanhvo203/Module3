package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> showListUser();
    void createUser (User user);
    void deleteUser (int id);
    void editUser(User user);
}
