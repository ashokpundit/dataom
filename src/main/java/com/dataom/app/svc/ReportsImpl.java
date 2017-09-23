/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dataom.app.svc;

/**
 *
 * @author ashok
 */
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.util.JSON;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ReportsImpl implements Reports{

        @Autowired
	private MongoTemplate mongo;
	
    @Override
    public String dailyUVReport() {
        
        
        DB db = mongo.getDb();
        DBCollection dbCol =  db.getCollection("dailyuv" );
	
        
        DBCursor dbc=dbCol.find();
        
        return JSON.serialize(dbc);
    }
    
}
