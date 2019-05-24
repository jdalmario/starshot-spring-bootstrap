package com.starshot.service;

import com.starshot.domain.TimeRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Service
public class TimeRecordService {

    private static final Logger logger = LoggerFactory.getLogger(TimeRecordService.class);


    private static List<TimeRecord> timeRecordList = new ArrayList<>();
    private static int id = 6;

    static {
        timeRecordList.add(new TimeRecord(1, "employee name 1", new Date(), new Date(), true));
        timeRecordList.add(new TimeRecord(2, "employee name 2", new Date(), new Date(), true));
        timeRecordList.add(new TimeRecord(3, "employee name 3", new Date(), new Date(), true));
        timeRecordList.add(new TimeRecord(4, "employee name 4", new Date(), new Date(), false));
        timeRecordList.add(new TimeRecord(5, "employee name 5", new Date(), new Date(), false));
        timeRecordList.add(new TimeRecord(6, "employee name 6", new Date(), new Date(), false));

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

    public void updateRecord(TimeRecord timeRecord) {
        timeRecordList.remove(timeRecord);
        timeRecordList.add(timeRecord);
    }

    public List<TimeRecord> filterRecord(TimeRecord timeRecord) {
        List<TimeRecord> filterTimeRecordList = timeRecordList;

        if(timeRecord.getEmployeeName() != null && timeRecord.getEmployeeName().length() > 0) {
            filterTimeRecordList = filterTimeRecord(filterTimeRecordList, timeRecord1 -> timeRecord1.getEmployeeName().equals(timeRecord.getEmployeeName()));
        }

        if(timeRecord.getActive() != null) {
            filterTimeRecordList = filterTimeRecord(filterTimeRecordList, timeRecord1 -> timeRecord1.getActive() == timeRecord.getActive());
        }


        return filterTimeRecordList;

    }

    private List<TimeRecord> filterTimeRecord(List<TimeRecord> timeRecords, Predicate<TimeRecord> timeRecordPredicate) {
        return timeRecords.stream().filter(timeRecordPredicate).collect(Collectors.toList());
    }

}
