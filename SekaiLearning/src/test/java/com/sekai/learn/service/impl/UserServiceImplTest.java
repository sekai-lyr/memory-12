package com.sekai.learn.service.impl;

import com.sekai.learn.mapper.SekaiLearnUserMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.verifyNoInteractions;

@ExtendWith(MockitoExtension.class)
class UserServiceImplTest {

    @Mock
    private SekaiLearnUserMapper userMapper;

    @InjectMocks
    private UserServiceImpl userService;

    @Test
    void rejectsInvalidRegistrationBeforeAccessingDatabase() {
        RuntimeException error = assertThrows(
            RuntimeException.class,
            () -> userService.register("ab", "123456", "昵称")
        );

        assertEquals("用户名长度需为 3-50 个字符", error.getMessage());
        verifyNoInteractions(userMapper);
    }

    @Test
    void loginWithMissingCredentialsReturnsEmpty() {
        assertTrue(userService.login(null, null).isEmpty());
        verifyNoInteractions(userMapper);
    }
}
