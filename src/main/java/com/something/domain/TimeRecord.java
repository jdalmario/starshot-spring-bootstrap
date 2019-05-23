package com.something.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

public class TimeRecord {

    private int id;
    private String employeeName;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date timeIn;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date timeOut;
    private Boolean active;


    public TimeRecord() {

    }

    public TimeRecord(int id, String employeeName, Date timeIn, Date timeOut, Boolean active) {
        this.id = id;
        this.employeeName = employeeName;
        this.timeIn = timeIn;
        this.timeOut = timeOut;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Date getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(Date timeIn) {
        this.timeIn = timeIn;
    }

    public Date getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(Date timeOut) {
        this.timeOut = timeOut;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TimeRecord that = (TimeRecord) o;
        return id == that.id &&
                Objects.equals(employeeName, that.employeeName) &&
                Objects.equals(timeIn, that.timeIn) &&
                Objects.equals(timeOut, that.timeOut) &&
                Objects.equals(active, that.active);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, employeeName, timeIn, timeOut, active);
    }

    @Override
    public String toString() {
        return "TimeRecord{" +
                "id=" + id +
                ", employeeName='" + employeeName + '\'' +
                ", timeIn=" + timeIn +
                ", timeOut=" + timeOut +
                ", active=" + active +
                '}';
    }
}