package com.sekai.learn.service.impl;

import com.sekai.learn.mapper.SekaiLearnCommentMapper;
import com.sekai.learn.mapper.SekaiLearnCreationMapper;
import com.sekai.learn.mapper.SekaiLearnLikeMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.verifyNoInteractions;

@ExtendWith(MockitoExtension.class)
class CreationServiceImplTest {

    @Mock
    private SekaiLearnCreationMapper creationMapper;
    @Mock
    private SekaiLearnCommentMapper commentMapper;
    @Mock
    private SekaiLearnLikeMapper likeMapper;

    @InjectMocks
    private CreationServiceImpl creationService;

    @Test
    void rejectsBlankCreationBeforeAccessingDatabase() {
        RuntimeException error = assertThrows(
            RuntimeException.class,
            () -> creationService.createCreation(1L, " ", "内容", null, "note", null)
        );

        assertEquals("标题不能为空且不能超过 200 个字符", error.getMessage());
        verifyNoInteractions(creationMapper, commentMapper, likeMapper);
    }

    @Test
    void rejectsUnsupportedCreationType() {
        RuntimeException error = assertThrows(
            RuntimeException.class,
            () -> creationService.createCreation(1L, "标题", "内容", null, "unknown", null)
        );

        assertEquals("作品类型无效", error.getMessage());
        verifyNoInteractions(creationMapper, commentMapper, likeMapper);
    }
}
