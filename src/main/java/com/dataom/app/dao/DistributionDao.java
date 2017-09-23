package com.dataom.app.dao;
import com.dataom.app.domain.Distribution;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Distribution.class)
public interface DistributionDao {

    List<Distribution> findAll();
}
