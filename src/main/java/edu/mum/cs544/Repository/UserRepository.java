package edu.mum.cs544.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.cs544.Domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	User findByusername(String username);

	User findByUserId(int userId);

	List<User> findByUsername(String username);	

}
