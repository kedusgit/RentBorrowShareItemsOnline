package edu.mum.cs544.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import edu.mum.cs544.Domain.Item;
import edu.mum.cs544.Domain.ItemCategory;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {
	List<Item> findAllByItemCategory(ItemCategory type);
	
	List<Item> findAllByOwnerUserIdNot(int ownerId);

	List<Item> findAllByItemDescriptionLike(String description);

	List<Item> findByItemNameLike(String name);

	List<Item> findAllByItemStatus(String status);

	Item findItemByItemId(int itemId);

	List<Item> findAllByOwner(int userId);

	Item findByItemId(int itemId);

	List<Item> findByItemCategoryAndItemNameLike(ItemCategory category, String searchText);

	Long deleteByItemId(Item item);
	List<Item> findAllByOwnerUserId(int userId);
}
