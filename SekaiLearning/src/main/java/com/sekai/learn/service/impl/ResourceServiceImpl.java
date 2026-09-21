package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnResourceDO;
import com.sekai.learn.mapper.SekaiLearnResourceMapper;
import com.sekai.learn.model.Resource;
import com.sekai.learn.service.ResourceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private SekaiLearnResourceMapper resourceMapper;

    @Override
    public List<Resource> getResourcesByCourseId(Long courseId) {
        List<SekaiLearnResourceDO> resources = resourceMapper.findByCourseId(courseId);
        return resources.stream().map(this::toModel).collect(Collectors.toList());
    }

    private Resource toModel(SekaiLearnResourceDO resourceDO) {
        Resource r = new Resource();
        BeanUtils.copyProperties(resourceDO, r);
        if (resourceDO.getCreatedAt() != null) r.setCreatedAt(resourceDO.getCreatedAt().toString());
        return r;
    }
}
