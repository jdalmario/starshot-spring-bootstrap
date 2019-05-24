package com.starshot.controller;

import com.starshot.domain.TimeRecord;
import com.starshot.service.TimeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class TimeRecordController {

    @Autowired
    TimeRecordService timeRecordService;

    @RequestMapping(value = "/timeRecord")
    public String create(Model model, HttpSession httpSession) {
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("username", httpSession.getAttribute("username"));
        return "main";
    }

    @RequestMapping(value = "/addTimeRecord", method = RequestMethod.POST)
    public String addTimeRecord(Model model, @ModelAttribute TimeRecord timeRecord) {
        timeRecordService.createRecord(timeRecord);
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("message", "Time Record Created!");
        return "main";
    }

    @RequestMapping(value = "/deleteTimeRecord", method = RequestMethod.POST)
    public String deleteTimeRecord(Model model, @RequestParam("id") int id) {
        timeRecordService.deleteRecord(id);
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("message", "Time Record Deleted!");
        return "main";
    }

    @RequestMapping(value = "/updateTimeRecord", method = RequestMethod.POST)
    public String updateTimeRecord(Model model, @ModelAttribute TimeRecord timeRecord) {
        timeRecordService.updateRecord(timeRecord);
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("message", "Time Record Updated!");
        return "main";
    }
}
