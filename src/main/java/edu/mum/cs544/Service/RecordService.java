package edu.mum.cs544.Service;

import java.util.List;

import edu.mum.cs544.Domain.Record;
import edu.mum.cs544.Domain.User;

public interface RecordService {
	public abstract List<Record> getAll();

	public abstract void add(Record record);

	public abstract Record get(int id);

	public abstract void delete(int recordId);

	public abstract Record findByRecordId(int recordId);

	public abstract List<Record> getUserRecords(int userId);
}
