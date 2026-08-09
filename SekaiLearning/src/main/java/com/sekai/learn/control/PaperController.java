package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/paper")
public class PaperController {

    @Autowired
    private PaperService paperService;

    @PostMapping("/upload")
    public Result<?> uploadPaper(@RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            String title = (String) body.get("title");
            String contentText = (String) body.get("contentText");
            String fileType = (String) body.getOrDefault("fileType", "txt");
            String characterId = (String) body.get("characterId");
            return Result.ok(paperService.uploadPaper(userId, title, contentText, fileType, characterId));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @GetMapping("/{paperId}")
    public Result<?> getPaper(@PathVariable Long paperId) {
        return paperService.getPaperById(paperId)
            .map(paper -> Result.ok(paper))
            .orElse(Result.fail("论文不存在"));
    }

    @GetMapping("/user/{userId}")
    public Result<?> getUserPapers(@PathVariable Long userId) {
        return Result.ok(paperService.getPapersByUserId(userId));
    }

    @GetMapping("/{paperId}/scenes")
    public Result<?> getScenes(@PathVariable Long paperId) {
        return Result.ok(paperService.getScenesByPaperId(paperId));
    }

    @PostMapping("/{paperId}/generate")
    public Result<?> generateScenes(@PathVariable Long paperId) {
        try {
            return Result.ok(paperService.generateScenes(paperId));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @DeleteMapping("/{paperId}")
    public Result<?> deletePaper(@PathVariable Long paperId, @RequestParam Long userId) {
        try {
            paperService.deletePaper(paperId, userId);
            return Result.ok("删除成功");
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
