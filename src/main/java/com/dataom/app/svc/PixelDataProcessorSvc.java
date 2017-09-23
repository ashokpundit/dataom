package com.dataom.app.svc;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadPoolExecutor;

import com.dataom.app.domain.Distribution;

public interface PixelDataProcessorSvc {
	void initIt();
	ThreadPoolExecutor getExecutor();
	void processData(String ip, String u, Map<String, Object> parameterMap, String country, String region);
	void mapDistributionData(String distribution, String u, String duid);
	List<Distribution> getDistributions();
}
