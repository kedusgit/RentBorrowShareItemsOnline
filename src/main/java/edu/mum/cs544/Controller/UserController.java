package edu.mum.cs544.Controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.mum.cs544.Domain.Address;
import edu.mum.cs544.Domain.Item;
import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Domain.UserRole;
import edu.mum.cs544.Service.UserService;

/**
 * @author KEDUS BEKELE
 *
 */

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// @RequestMapping(value = "/profile/{userId}", method = RequestMethod.GET)
	// public String showProfileOfuser(@PathVariable("userId") Integer userId,
	// Model model, HttpSession session) {
	// User user = userService.getUserByuserId(userId);
	// model.addAttribute("user", user);
	// return "/users/user/userprofiledetail";
	// }

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String signup(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	// @RequestMapping(value = "/register", method = RequestMethod.POST)
	// public String signupProcess(@Valid User user, BindingResult result,
	// Errors errors, RedirectAttributes redirectAttrs,
	// HttpSession session) {
	// if (result.hasErrors()) {
	// errors.reject("invalied inputs");
	// return "redirect:/error";
	// }
	// if (user != null) {
	// User usr = new User();
	// usr = userService.findByUsername(user.getUsername());
	// if (usr != null) {
	// session.setAttribute("msg", "User Already Exists");
	// return "error";
	// }
	// }
	// user.setRole("ROLE_USER");
	// session.setAttribute("user", user);
	// userService.save(user);
	// return "/registerSuccess";
	// }

	// @RequestMapping(value = "/edit", method = RequestMethod.POST)
	// public String editProfile(User newUserData, HttpSession session) throws
	// IOException {
	// User loggedInUser = userService
	// .getLoggedInMemeberByuserName(((User)
	// session.getAttribute("user")).getFirstName());
	// loggedInUser.setFirstName(newUserData.getFirstName());
	// loggedInUser.setLastName(newUserData.getLastName());
	// loggedInUser.setEmail(newUserData.getEmail());
	// loggedInUser.setAddress((Address) newUserData.getAddress());
	// userService.saveuser(loggedInUser);
	// return "redirect:/home";
	// }

	@RequestMapping("/listUser")
	public String userList(Model model) {
		List<User> listUser = userService.findAll();
		model.addAttribute("users", listUser);
		return "listUser";

	}

	@RequestMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") int userId, Model model) {
		userService.deleteUser(userId);
		return "redirect:/listUser";
	}
}
