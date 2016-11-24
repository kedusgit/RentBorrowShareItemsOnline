package edu.mum.cs544.Service;

import java.util.List;

import edu.mum.cs544.Domain.Item;
import edu.mum.cs544.Domain.ItemCategory;

public interface ItemService {

	List<Item> getAllitems();
	
	List<Item> findAllItemsExceptOwner(int ownerId);
	void addItem(Item newItem);

	void saveOrUpdateItem(Item editedItem);

	List<Item> findByNameLike(String searchText);

	List<Item> findAllByStatus(String status);

	List<Item> getIByuserId(Integer userId);

	void save(Item item);

	Item getItemId(Integer id);

	List<Item> getItemByItemCatagory(ItemCategory catagory);

	Item findById(int itemId);

	List<Item> findByCategoryAndNameLike(ItemCategory category, String searchText);

	void deleteitem(int itemId);

	List<Item> getAllOwnItems(int userId);

}