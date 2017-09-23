package com.dataom.app.svc;

import java.util.Calendar;
import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

public abstract class Utils {

	public static String getDateString(int todayPlusDays) {
		Calendar cl = Calendar.getInstance();
		cl.add(Calendar.DATE, todayPlusDays);
		String str =  "" + cl.get(Calendar.YEAR) + ((cl.get(Calendar.MONTH) < 9) ? "0" : "") + (cl.get(Calendar.MONTH) +1) + ((cl.get(Calendar.DATE) < 10) ? "0" : "") + cl.get(Calendar.DATE);
		return str;
	}
	
	public static String getErrorMessage(BindingResult results) {
	    List<FieldError> errs = results.getFieldErrors();
	    StringBuilder builder  = new StringBuilder();
	    for(FieldError err:errs) {
		builder.append("value "+err.getRejectedValue()+" rejected");
	    }
	    return builder.toString();
	}
}
