package com.sekai.learn.service;

import com.sekai.learn.model.Character;
import java.util.List;

public interface CharacterService {
    List<Character> getAllCharacters();
    Character getCharacterById(String id);
}
