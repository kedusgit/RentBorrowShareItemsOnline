package edu.mum.cs544.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Repository.UserRepository;
import edu.mum.cs544.Service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository userRepository;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void save(User user) {

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);

		userRepository.save(user);
	}

	@Override
	public List<User> findAll() {
		return (List<User>) userRepository.findAll();
	}

	@Override
	public List<User> findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void deleteUser(Integer id) {
		userRepository.delete(id);

	}

	@Override
	public User getLoggedInUser(String username) {
		return userRepository.findByusername(username);
	}

	@Override
	public User findByUserId(int userId) {
		// TODO Auto-generated method stub
		return userRepository.findByUserId(userId);
	}

}
