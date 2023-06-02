package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showListUser();
    void createUser (User user);
    void deleteUser(int id);
    void editUser(int id,User user);
    User searchByCountry(String country);
}
