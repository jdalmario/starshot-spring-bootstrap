package com.something;

import com.something.domain.TimeRecord;

import java.util.Comparator;

public class SortByName implements Comparator<TimeRecord> {

    @Override
    public int compare(TimeRecord o1, TimeRecord o2) {
        return o1.getEmployeeName().compareTo(o2.getEmployeeName());
    }
}
