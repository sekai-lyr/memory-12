package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.CourseService;
import com.sekai.learn.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private ResourceService resourceService;

    @GetMapping("/subjects")
    public Result<?> getSubjects() {
        return Result.ok(courseService.getSubjects());
    }

    @GetMapping("/subject/{id}")
    public Result<?> getSubject(@PathVariable Long id) {
        return Result.ok(courseService.getSubjectById(id));
    }

    @GetMapping("/subject/{subjectId}/courses")
    public Result<?> getCoursesBySubject(@PathVariable Long subjectId,
                                          @RequestParam(required = false) Long userId) {
        return Result.ok(courseService.getCoursesBySubjectId(subjectId, userId));
    }

    @GetMapping("/course/{id}")
    public Result<?> getCourse(@PathVariable Long id,
                                @RequestParam(required = false) Long userId) {
        return Result.ok(courseService.getCourseById(id, userId));
    }

    @GetMapping("/course/{courseId}/lessons")
    public Result<?> getLessons(@PathVariable Long courseId,
                                 @RequestParam(required = false) Long userId) {
        return Result.ok(courseService.getLessonsByCourseId(courseId, userId));
    }

    @GetMapping("/lesson/{id}")
    public Result<?> getLesson(@PathVariable Long id,
                                @RequestParam(required = false) Long userId) {
        return Result.ok(courseService.getLessonById(id, userId));
    }

    @GetMapping("/course/{courseId}/resources")
    public Result<?> getCourseResources(@PathVariable Long courseId) {
        return Result.ok(resourceService.getResourcesByCourseId(courseId));
    }
}
