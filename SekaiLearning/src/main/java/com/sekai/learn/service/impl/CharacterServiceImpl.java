package com.sekai.learn.service.impl;

import com.sekai.learn.mapper.SekaiLearnCharacterMapper;
import com.sekai.learn.model.Character;
import com.sekai.learn.service.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CharacterServiceImpl implements CharacterService {

    @Autowired
    private SekaiLearnCharacterMapper characterMapper;

    @Override
    public List<Character> getAllCharacters() {
        return characterMapper.findAllEnabled();
    }

    @Override
    public Character getCharacterById(String id) {
        return characterMapper.findById(id);
    }
}
