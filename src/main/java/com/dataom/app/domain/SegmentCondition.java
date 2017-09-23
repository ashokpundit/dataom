package com.dataom.app.domain;

import java.math.BigInteger;
import java.util.List;

import javax.script.Bindings;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.SimpleScriptContext;

import org.springframework.roo.addon.javabean.RooJavaBean;

@RooJavaBean
public class SegmentCondition {

    private List<BigInteger> attrs;

    private Integer minFrequency;

    private String conjunction;

    public static void main(String[] args) throws Exception {
	ScriptEngineManager factory = new ScriptEngineManager();
	ScriptEngine engine = factory.getEngineByName("JavaScript");
	ScriptContext ctx = new SimpleScriptContext();
	Bindings bindings = ctx.getBindings(ScriptContext.ENGINE_SCOPE);
	bindings.put("abc", "arix");
	Boolean b = (Boolean) engine.eval("abc=='X' ||  new RegExp(/ar.n/).test(abc)", ctx);
	System.out.println(b);
    };
}