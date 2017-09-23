package com.dataom.app.domain;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Segment {

    /**
     */
    private String name;

    /**
     */
    private String description;

    /**
     */
    private Boolean disabled;

    private Boolean historicNature;

    private Integer recencyDays = 1;

    private List<SegmentCondition> conditions;

    private Map<BigInteger, Integer> distribution;

    private Long population60d;

    private Long population30d;

    private Long populationDaily;
}
