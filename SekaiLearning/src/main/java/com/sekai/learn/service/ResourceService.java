package com.sekai.learn.service;

import com.sekai.learn.model.Resource;
import java.util.List;

public interface ResourceService {
    List<Resource> getResourcesByCourseId(Long courseId);
}
