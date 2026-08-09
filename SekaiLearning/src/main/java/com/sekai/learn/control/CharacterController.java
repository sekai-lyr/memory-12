package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/character")
public class CharacterController {

    @Autowired
    private CharacterService characterService;

    @GetMapping("/list")
    public Result<?> getAllCharacters() {
        return Result.ok(characterService.getAllCharacters());
    }

    @GetMapping("/{id}")
    public Result<?> getCharacter(@PathVariable String id) {
        return characterService.getCharacterById(id) != null
            ? Result.ok(characterService.getCharacterById(id))
            : Result.fail("角色不存在");
    }
}
