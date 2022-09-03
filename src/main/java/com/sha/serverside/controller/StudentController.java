package com.sha.serverside.controller;

import com.sha.serverside.model.*;
import com.sha.serverside.service.CourseStudentService;
import com.sha.serverside.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class StudentController {

    @Autowired
    private CourseStudentService courseStudentService;

    @Autowired
    private UserService studentService;

    @GetMapping("/api/student/courses/{studentId}")
    public ResponseEntity<?> findAllCoursesOfStudent(@PathVariable Long studentId){
        List<Course> courseList =
                courseStudentService.findAllCoursesOfStudent(studentId).stream()
                        .map(cs -> cs.getCourse())
                        .collect(Collectors.toList());
        return new ResponseEntity<>(courseList, HttpStatus.OK);
    }

    @GetMapping("/api/student/{username}")
    public ResponseEntity<?> findStudentByUserName(@PathVariable String username){
        User user = studentService.findByUsername(username);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @PostMapping("/api/student/enroll")
    public ResponseEntity<?> enroll(@RequestBody CourseStudent courseStudent){
        return new ResponseEntity<>(courseStudentService.saveCourseStudent(courseStudent), HttpStatus.CREATED);
    }

    @PostMapping("/api/student/de-enroll")
    public ResponseEntity<?> deEnrollCourse(@RequestBody CourseStudent courseStudent){
            courseStudentService.deleteCourseStudent(courseStudent);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
