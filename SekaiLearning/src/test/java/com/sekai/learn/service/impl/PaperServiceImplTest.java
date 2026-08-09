package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnPaperDO;
import com.sekai.learn.mapper.SekaiLearnPaperMapper;
import com.sekai.learn.mapper.SekaiLearnSceneMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class PaperServiceImplTest {

    @Mock
    private SekaiLearnPaperMapper paperMapper;
    @Mock
    private SekaiLearnSceneMapper sceneMapper;

    @InjectMocks
    private PaperServiceImpl paperService;

    @Test
    @SuppressWarnings({"rawtypes", "unchecked"})
    void regenerationReplacesExistingScenes() {
        SekaiLearnPaperDO paper = new SekaiLearnPaperDO();
        paper.setId(7L);
        paper.setContentText("第一部分\n\n第二部分");
        paper.setCharacterId("char-miku");
        when(paperMapper.findById(7L)).thenReturn(paper);

        paperService.generateScenes(7L);

        var ordered = inOrder(sceneMapper);
        ordered.verify(sceneMapper).deleteByPaperId(7L);
        ArgumentCaptor<List> scenesCaptor = ArgumentCaptor.forClass(List.class);
        ordered.verify(sceneMapper).insertBatch(scenesCaptor.capture());
        assertFalse(scenesCaptor.getValue().isEmpty());
    }
}
