package service;

import model.User;
import repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private UserRepository repository = new UserRepository();
    @Override
    public List<User> showListUser() {
        return repository.showListUser();
    }

    @Override
    public void createUser(User user) {
        repository.createUser(user);
    }

    @Override
    public void deleteUser(int id) {
        repository.deleteUser(id);
    }

    @Override
    public void editUser(int id,User user) {
        repository.editUser(id,user);
    }

    @Override
    public User searchByCountry(String country) {
        return repository.searchByCountry(country);
    }
}
