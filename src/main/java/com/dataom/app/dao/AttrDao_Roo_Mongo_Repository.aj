// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dataom.app.dao;

import com.dataom.app.dao.AttrDao;
import com.dataom.app.domain.Attr;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect AttrDao_Roo_Mongo_Repository {
    
    declare parents: AttrDao extends PagingAndSortingRepository<Attr, BigInteger>;
    
    declare @type: AttrDao: @Repository;
    
}