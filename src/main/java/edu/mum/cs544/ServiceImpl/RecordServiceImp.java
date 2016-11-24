package edu.mum.cs544.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.cs544.Domain.Record;
import edu.mum.cs544.Domain.User;
import edu.mum.cs544.Repository.RecordRepository;
import edu.mum.cs544.Service.RecordService;

@Service
public class RecordServiceImp implements RecordService {

	@Autowired
	RecordRepository recordRepository;

	@Override
	public List<Record> getAll() {
		// TODO Auto-generated method stub
		return (List<Record>) recordRepository.findAll();
	}

	@Override
	public void add(Record record) {
		// TODO Auto-generated method stub
		recordRepository.save(record);
	}

	@Override
	public Record get(int id) {
		// TODO Auto-generated method stub
		return recordRepository.getOne(id);
	}

	@Override
	public void delete(int recordId) {
		// TODO Auto-generated method stub
		recordRepository.delete(recordId);
	}

	@Override
	public Record findByRecordId(int recordId) {
		// TODO Auto-generated method stub
		return recordRepository.findById(recordId);
	}

	@Override
	public List<Record> getUserRecords(int userId) {
		// TODO Auto-generated method stub
		return recordRepository.findByUserIdUserId(userId);
	}
	
}
