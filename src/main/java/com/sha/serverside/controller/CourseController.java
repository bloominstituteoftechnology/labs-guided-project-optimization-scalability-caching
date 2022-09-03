package com.sha.serverside.controller;

import com.sha.serverside.jwt.JwtTokenProvider;
import com.sha.serverside.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class CourseController {

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Autowired
    private CourseService courseService;


    @GetMapping("/api/course/{courseId}")
    public ResponseEntity<?> findCourseById(@PathVariable Long courseId){
        return ResponseEntity.ok(courseService.findCourseById(courseId));
    }
}
