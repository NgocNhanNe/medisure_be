package com.medisure.medisure_as.rest;

import com.medisure.medisure_as.entity.Blog;
import com.medisure.medisure_as.entity.ImageSchedule;
import com.medisure.medisure_as.repository.ImageScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class ImageScheduleRest {

    @Autowired
    private ImageScheduleRepository imageScheduleRepository;

    @GetMapping("/public/ImageScheduleByScheduleId")
    public List<ImageSchedule> findBySchedule(@RequestParam("id") Long id){
        return imageScheduleRepository.findBySchedule(id);
    }

    @PostMapping("/doctor/saveImageSchedule")
    public void saveOrUpdate(@RequestBody ImageSchedule imageSchedule){
        imageScheduleRepository.save(imageSchedule);
    }

    @DeleteMapping("/doctor/deleteImageSchedule")
    public void saveOrUpdate(@RequestParam("id") Long id){
        imageScheduleRepository.deleteById(id);
    }
}
