package edu.mum.cs544.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.cs544.Domain.Record;
import edu.mum.cs544.Domain.User;

@Repository
public interface RecordRepository extends JpaRepository<Record, Integer> {
	

	Record findById(Integer recordId);
	List<Record> findByUserIdUserId(Integer userId);
	
	
}
