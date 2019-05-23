package com.something.service;

import com.something.domain.TimeRecord;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class TimeRecordService {

    private static List<TimeRecord> timeRecordList = new ArrayList<>();
    private static int id = 3;

    static {
        timeRecordList.add(new TimeRecord(1, "employee name 1", new Date(), new Date(), true));
        timeRecordList.add(new TimeRecord(2, "employee name 2", new Date(), new Date(), true));
        timeRecordList.add(new TimeRecord(3, "employee name 3", new Date(), new Date(), true));
    }

    public void createRecord(TimeRecord timerecord) {
        timerecord.setId(++id);
        timeRecordList.add(timerecord);
    }

    public List<TimeRecord> getTimeRecordList() {
        return this.timeRecordList;
    }

    public void deleteRecord(int id) {
        Iterator<TimeRecord> timeRecordIterator = timeRecordList.iterator();
        while (timeRecordIterator.hasNext()) {
            TimeRecord timeRecord = timeRecordIterator.next();
            if (timeRecord.getId() == id) {
                timeRecordIterator.remove();
            }
        }
    }
}
