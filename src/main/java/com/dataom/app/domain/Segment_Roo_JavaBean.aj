// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dataom.app.domain;

import com.dataom.app.domain.Segment;
import com.dataom.app.domain.SegmentCondition;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

privileged aspect Segment_Roo_JavaBean {
    
    public String Segment.getName() {
        return this.name;
    }
    
    public void Segment.setName(String name) {
        this.name = name;
    }
    
    public String Segment.getDescription() {
        return this.description;
    }
    
    public void Segment.setDescription(String description) {
        this.description = description;
    }
    
    public Boolean Segment.getDisabled() {
        return this.disabled;
    }
    
    public void Segment.setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }
    
    public Boolean Segment.getHistoricNature() {
        return this.historicNature;
    }
    
    public void Segment.setHistoricNature(Boolean historicNature) {
        this.historicNature = historicNature;
    }
    
    public Integer Segment.getRecencyDays() {
        return this.recencyDays;
    }
    
    public void Segment.setRecencyDays(Integer recencyDays) {
        this.recencyDays = recencyDays;
    }
    
    public List<SegmentCondition> Segment.getConditions() {
        return this.conditions;
    }
    
    public void Segment.setConditions(List<SegmentCondition> conditions) {
        this.conditions = conditions;
    }
    
    public Map<BigInteger, Integer> Segment.getDistribution() {
        return this.distribution;
    }
    
    public void Segment.setDistribution(Map<BigInteger, Integer> distribution) {
        this.distribution = distribution;
    }
    
    public Long Segment.getPopulation60d() {
        return this.population60d;
    }
    
    public void Segment.setPopulation60d(Long population60d) {
        this.population60d = population60d;
    }
    
    public Long Segment.getPopulation30d() {
        return this.population30d;
    }
    
    public void Segment.setPopulation30d(Long population30d) {
        this.population30d = population30d;
    }
    
    public Long Segment.getPopulationDaily() {
        return this.populationDaily;
    }
    
    public void Segment.setPopulationDaily(Long populationDaily) {
        this.populationDaily = populationDaily;
    }
    
}
