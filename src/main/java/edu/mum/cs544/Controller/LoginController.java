package edu.mum.cs544.Controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.servlet.mvc.condition.RequestCondition;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.cs544.Domain.ItemCategory;
import edu.mum.cs544.Domain.ItemStatus;
import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Domain.UserRole;
import edu.mum.cs544.Service.ItemService;
import edu.mum.cs544.Service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	ItemService itemService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		/*
		 * User user = new User(); user.setEnabled(true);
		 * user.setUsername("shrestha"); user.setPassword("shrestha");
		 * user.setRole("ROLE_ADMIN"); userService.save(user);
		 */

		return "home";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/postLogin")
	public String success(Principal principal, RedirectAttributes redAttr, HttpServletRequest request) {
		String username = principal.getName();
		HttpSession session = request.getSession(true);
		User user = userService.getLoggedInUser(username);
		session.setAttribute("user", user);
		session.setAttribute("userId", user.getUserId());
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		session.setAttribute("itemCategories", itemCategories);
		List<ItemStatus> itemStatus = Arrays.asList(ItemStatus.values());
		session.setAttribute("itemStatus", itemStatus);
		System.out.println("success");
		System.out.println(username);
		redAttr.addAttribute("user", username);
		return "redirect:/item/all";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(@ModelAttribute("loginUser") User user, Model model) {
		List<UserRole> userRole = Arrays.asList(UserRole.values());
		model.addAttribute("userRole", userRole);
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("loginUser") User user, BindingResult result,
			RedirectAttributes redirectAttr, Model model, Principal user1) {
		/*
		 * System.out.println(user1.getName()); List<User> u =
		 * userService.findByUsername(user1.getName()); for(User ur: u){
		 * System.out.println(ur.getGender()); }
		 */
		if (result.hasErrors()) {
			return "register";
		}
		if (!user.getPassword().equals(user.getVerifyPassword())) {
			model.addAttribute("message", "password doesn't match");

		}
		userService.save(user);
		redirectAttr.addFlashAttribute("success", "Successfully added new user!");
		return "redirect:/register";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
	public String loginerror(@ModelAttribute("loginUser") User user, Model model) {

		model.addAttribute("error", "true");
		return "home";

	}
	/*
	 * @RequestMapping("/listUser") public String userList(Model model){
	 * List<User> listUser = userService.findAll(); model.addAttribute("users" ,
	 * listUser); return "listUser";
	 * 
	 * }
	 * 
	 * @RequestMapping("/deleteUser/{id}") public String
	 * deleteUser(@PathVariable("id")int userId){
	 * userService.deleteUser(userId); return "listUser"; }
	 */
}
