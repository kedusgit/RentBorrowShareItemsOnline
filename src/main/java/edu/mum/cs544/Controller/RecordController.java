package edu.mum.cs544.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.cs544.Domain.Item;
import edu.mum.cs544.Domain.Record;
import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Service.ItemService;
import edu.mum.cs544.Service.RecordService;

@Controller
public class RecordController {

	@Autowired
	RecordService recordService;

	@Autowired
	private ItemService itemService;

	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, "startDate", new CustomDateEditor(dateFormatter, true));
		binder.registerCustomEditor(Date.class, "endDate", new CustomDateEditor(dateFormatter, true));
	}

	@RequestMapping(value = "/record/get/{userId}", method = RequestMethod.GET)
	public String getUserBorrowRecords(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("userId", user.getUserId());
		List<Record> records = recordService.getUserRecords(user.getUserId());
		if (records.size() > 0) {
			model.addAttribute("record", records);
		}
		return "profile";
	}

	@RequestMapping(value = "/record/borrow/addItem/{userId}", method = RequestMethod.POST)
	public String add(@ModelAttribute("record") Record record, BindingResult result, @PathVariable("userId") int userId,
			Model model) {
		Item item = itemService.getItemId(record.getItemId().getItemId());
		int odlItemQuantity = item.getItemQuantity();
		int newItemQuantity = odlItemQuantity - record.getItemQuantity();
		item.setItemQuantity(newItemQuantity);
		itemService.saveOrUpdateItem(item);
		recordService.add(record);
		return "redirect:/record/get/" + userId;
	}

	@RequestMapping(value = "/record/borrow/deleteItem/{recordId}/{userId}", method = RequestMethod.GET)
	public String deleteAnItem(@PathVariable("recordId") int recordId, @PathVariable("userId") int userId) {
		recordService.delete(recordId);
		return "redirect:/record/get/"+userId;

	}

}
