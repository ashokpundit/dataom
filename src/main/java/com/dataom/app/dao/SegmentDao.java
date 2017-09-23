package com.dataom.app.dao;
import com.dataom.app.domain.Segment;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Segment.class)
public interface SegmentDao {

    List<Segment> findAll();
}
