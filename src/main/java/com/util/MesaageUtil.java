package com.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class MesaageUtil {
	public  void merssageSend(String title,String content,String Phone) {
		
		String akey = "NCSFFMLELLZMNXVG"; //라이센스2
	    String psecret = "L0G4PPK4N9OWIVQUSWG64X78IZJGVD5P"; //라이센스1
	    
		Message kajyeogajo = new Message(akey, psecret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to",Phone);	// 받는사람
	    params.put("from", "01036154287");	// 보내는사람
	    params.put("type", "SMS");
	    params.put("text",content);
	    params.put("app_version",title); //등록 아이피

	    try {
	      JSONObject obj = (JSONObject) kajyeogajo.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
}
