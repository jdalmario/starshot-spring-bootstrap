package com.something.login;

import com.something.domain.TimeRecord;
import com.something.service.TimeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class TimeRecordController {

    @Autowired
    TimeRecordService timeRecordService;

    @RequestMapping(value = "/timeRecord")
    public String create(Model model) {
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        return "main";
    }

    @RequestMapping(value = "/addTimeRecord", method = RequestMethod.POST)
    public String addTimeRecord(ModelMap model, @ModelAttribute TimeRecord timeRecord) {
        timeRecordService.createRecord(timeRecord);
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("message", "Time Record Created!");
        return "main";
    }

    @RequestMapping(value = "/deleteTimeRecord", method = RequestMethod.POST)
    public String deleteTimeRecord(ModelMap model, @RequestParam("id") int id) {
        timeRecordService.deleteRecord(id);
        model.addAttribute("timeRecords", timeRecordService.getTimeRecordList());
        model.addAttribute("message", "Time Record Deleted!");
        return "main";
    }
}
