// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dataom.app.web;

import com.dataom.app.dao.DistributionDao;
import com.dataom.app.domain.Distribution;
import com.dataom.app.web.ApplicationConversionServiceFactoryBean;
import java.math.BigInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    DistributionDao ApplicationConversionServiceFactoryBean.distributionDao;
    
    public Converter<Distribution, String> ApplicationConversionServiceFactoryBean.getDistributionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dataom.app.domain.Distribution, java.lang.String>() {
            public String convert(Distribution distribution) {
                return new StringBuilder().append(distribution.getName()).append(' ').append(distribution.getDtype()).append(' ').append(distribution.getDescription()).append(' ').append(distribution.getSyncCall()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Distribution> ApplicationConversionServiceFactoryBean.getIdToDistributionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.dataom.app.domain.Distribution>() {
            public com.dataom.app.domain.Distribution convert(java.math.BigInteger id) {
                return distributionDao.findOne(id);
            }
        };
    }
    
    public Converter<String, Distribution> ApplicationConversionServiceFactoryBean.getStringToDistributionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dataom.app.domain.Distribution>() {
            public com.dataom.app.domain.Distribution convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Distribution.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getDistributionToStringConverter());
        registry.addConverter(getIdToDistributionConverter());
        registry.addConverter(getStringToDistributionConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}