package com.sekai.learn.service;

import com.sekai.learn.model.AnimeClip;
import java.util.List;

public interface AnimeClipService {
    List<AnimeClip> getAllClips();
    List<AnimeClip> getClipsByDifficulty(String difficulty);
    AnimeClip getClipById(Long id);
}
