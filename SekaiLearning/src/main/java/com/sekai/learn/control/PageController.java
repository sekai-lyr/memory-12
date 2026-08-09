package com.sekai.learn.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @GetMapping("/learn")
    public String learnPage() {
        return "learn/index";
    }

    @GetMapping("/learn/paper")
    public String paperPage() {
        return "learn/paper";
    }

    @GetMapping("/learn/anime")
    public String animePage() {
        return "learn/anime";
    }

    @GetMapping("/learn/community")
    public String communityPage() {
        return "learn/community";
    }

    @GetMapping("/learn/profile")
    public String profilePage() {
        return "learn/profile";
    }

    @GetMapping({"/learn/courses", "/learn/course/{id}", "/learn/lesson/{id}"})
    public String coursesPage() {
        return "learn/courses";
    }

    @GetMapping("/")
    public String index() {
        return "redirect:/learn";
    }
}
