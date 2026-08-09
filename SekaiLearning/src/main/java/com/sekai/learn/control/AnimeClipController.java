package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.AnimeClipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/anime")
public class AnimeClipController {

    @Autowired
    private AnimeClipService animeClipService;

    @GetMapping("/clips")
    public Result<?> getAllClips() {
        return Result.ok(animeClipService.getAllClips());
    }

    @GetMapping("/clips/{difficulty}")
    public Result<?> getClipsByDifficulty(@PathVariable String difficulty) {
        return Result.ok(animeClipService.getClipsByDifficulty(difficulty));
    }

    @GetMapping("/clip/{id}")
    public Result<?> getClip(@PathVariable Long id) {
        return animeClipService.getClipById(id) != null
            ? Result.ok(animeClipService.getClipById(id))
            : Result.fail("片段不存在");
    }
}
