package edu.mum.cs544.Service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.mum.cs544.Domain.User;

public interface UserService {

	public void save(User user);

	public List<User> findAll();

	// public User findByUsername(String username);


	public User getLoggedInUser(String username);

	User findByUserId(int userId);

	public void deleteUser(Integer id);

	@Query("SELECT u from User u where u.username=:username")
	public List<User> findByUsername(@Param("username") String username);

}
