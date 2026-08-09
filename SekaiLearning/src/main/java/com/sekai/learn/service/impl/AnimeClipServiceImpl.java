package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnAnimeClipDO;
import com.sekai.learn.mapper.SekaiLearnAnimeClipMapper;
import com.sekai.learn.model.AnimeClip;
import com.sekai.learn.service.AnimeClipService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AnimeClipServiceImpl implements AnimeClipService {

    @Autowired
    private SekaiLearnAnimeClipMapper clipMapper;

    @Override
    public List<AnimeClip> getAllClips() {
        return clipMapper.findAllEnabled().stream()
            .map(this::toModel)
            .collect(Collectors.toList());
    }

    @Override
    public List<AnimeClip> getClipsByDifficulty(String difficulty) {
        return clipMapper.findByDifficulty(difficulty).stream()
            .map(this::toModel)
            .collect(Collectors.toList());
    }

    @Override
    public AnimeClip getClipById(Long id) {
        SekaiLearnAnimeClipDO clipDO = clipMapper.findById(id);
        return clipDO != null ? toModel(clipDO) : null;
    }

    private AnimeClip toModel(SekaiLearnAnimeClipDO clipDO) {
        AnimeClip clip = new AnimeClip();
        BeanUtils.copyProperties(clipDO, clip);
        if (clipDO.getCreatedAt() != null) clip.setCreatedAt(clipDO.getCreatedAt().toString());
        return clip;
    }
}
