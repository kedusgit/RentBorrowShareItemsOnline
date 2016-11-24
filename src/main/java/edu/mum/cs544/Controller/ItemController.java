package edu.mum.cs544.Controller;

import java.io.IOException;

import java.util.Arrays;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.cs544.Domain.Item;
import edu.mum.cs544.Domain.ItemCategory;
import edu.mum.cs544.Domain.ItemStatus;
import edu.mum.cs544.Domain.Record;
import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	private ItemService itemService;

	@RequestMapping(value = { "", "/all" })
	public String list(Model model, HttpSession session) {
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		int ownerId = ((User) session.getAttribute("user")).getUserId();
		model.addAttribute("itemCategories", itemCategories);
		model.addAttribute("items", itemService.findAllItemsExceptOwner(ownerId));
		return "items";
	}

	@RequestMapping(value = "/ownItems", method = RequestMethod.GET)
	public String getOwnItems(Model model, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		model.addAttribute("itemCategories", itemCategories);
		System.out.println("size of own items= " + itemService.getAllOwnItems(userId).size());
		model.addAttribute("items", itemService.getAllOwnItems(userId));
		return "ownItems";
	}

	@RequestMapping("/{itemCategory}")
	public @ResponseBody Item getItemById(@PathVariable("itemCategory") ItemCategory itemCategory, Model model) {
		
		Item item = (Item) itemService.getItemByItemCatagory(itemCategory);
		model.addAttribute("item", item);
		return item;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewItemForm(@ModelAttribute("newItem") Item newItem, Model model) {
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		List<ItemStatus> itemStatus = Arrays.asList(ItemStatus.values());
		model.addAttribute("itemCategories", itemCategories);
		model.addAttribute("itemStatus", itemStatus);
		return "addItem";
	}

	@RequestMapping(value = "/add", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void processImageUpload(@RequestParam("item") MultipartFile itemImage, HttpSession session)
			throws IOException {
		Item item = (Item) session.getAttribute("itemImage");
		item.setItemImage(itemImage.getBytes());
		itemService.save(item);
		return;
	}

	@RequestMapping(value = "/image/{itemId}", produces = MediaType.IMAGE_PNG_VALUE)
	public ResponseEntity<byte[]> getImage(@PathVariable("itemId") int itemId) throws IOException {
		Item item = itemService.findById(itemId);
		System.out.println("itemId: " + itemId);
		byte[] imageContent = item.getItemImage();
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewItemForm(@Valid @ModelAttribute("newItem") Item newItem, BindingResult result,
			HttpSession session, RedirectAttributes flashAttrs) {
		if (result.hasErrors()) {

			return "addItem";
		}

		try {
			User user = (User) session.getAttribute("user");
			newItem.setOwner(user);
			itemService.addItem(newItem);
		} catch (Exception up) {
			up.printStackTrace();
			System.out.println("Transaction Failed!!!");

		}
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		flashAttrs.addAttribute("itemCategories", itemCategories);
		return "redirect:/item";
	}

	@RequestMapping(value = "/get/{itemId}", method = RequestMethod.GET)
	public String BorrowOrLendAnItem(@ModelAttribute("record") Record record, @PathVariable("itemId") int _itemId,
			Model model) {
		Item item = itemService.getItemId(_itemId);
		model.addAttribute("userId", 3);
		model.addAttribute("item", item);
		model.addAttribute("itemQuantity", item.getItemQuantity());
		String dest = "";
		if (item.getItemQuantity() > 0) {
			dest = "successful";
			model.addAttribute("status", item.getItemStatus());
		} else {
			dest = "failer";
		}
		return dest;
	}

	@RequestMapping(value = "/editItem/{id}", method = RequestMethod.GET)
	public String editItemByGet(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("item", itemService.getItemId(id));
		return "editItem";
	}

	@RequestMapping(value = "/editItem", method = RequestMethod.POST)
	public String editResourceFormProcess(Model model, @Valid @ModelAttribute("item") Item item,
			HttpServletRequest request, RequestAttributes redirectAttributes) {
		Item editedItem = itemService.getItemId(item.getItemId());
		editedItem.setItemName(item.getItemName());
		editedItem.setItemDescription(item.getItemDescription());
		editedItem.setItemPrice(item.getItemPrice());
		editedItem.setItemQuantity(item.getItemQuantity());
		itemService.saveOrUpdateItem(editedItem);
		return "redirect:/item/ownItems";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchforGet(Model model) {
		List<ItemCategory> itemCategories = Arrays.asList(ItemCategory.values());
		List<ItemStatus> itemStatus = Arrays.asList(ItemStatus.values());
		model.addAttribute("itemCategories", itemCategories);
		model.addAttribute("itemStatus", itemStatus);

		return "searchItem";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchResource(@RequestParam("category") String categoryValue,
			@RequestParam("searchText") String searchText, Model model) {
		System.out.println("we got into searching method");
		ItemCategory category = ItemCategory.valueOf(categoryValue);
		List<Item> items = itemService.findByCategoryAndNameLike(category, searchText);
		if (items == null) {
			System.out.println("found no items");
		}
		System.out.println("found " + items.size() + " items");
		model.addAttribute("items", items);
		return "searchResults";
	}
	

	@RequestMapping("/delete/{itemId}")
	public String deleteitem(@PathVariable int itemId, Model model, HttpServletRequest request) throws Throwable {
		itemService.deleteitem(itemId);
		return "redirect:/item/ownItems";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}


}