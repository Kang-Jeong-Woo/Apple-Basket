package com.foodshring.VO;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;

public class PayWebHostVo
{
	static String	LOG_HOME_DIR		= "";//로그남겨줌

	static String KSPAY_WEBHOST_URL = "http://kspay.ksnet.to/store/KSPayFlashV1.3/web_host/recv_post.jsp"; //받음

	static char DEFAULT_DELIM = '`';
    String DEFAULT_RPARAMS	= "authyn`trno`trddt`trdtm`amt`authno`msg1`msg2`ordno`isscd`aqucd`result`halbu`cbtrno`cbauthno";

    String		payKey		;
	String		rparams		;
	String		mtype		;

	String[]	rnames		= null;
	HashMap		rvHash		= null;

	public PayWebHostVo(String _payKey) {
		this.payKey		= _payKey;
		this.rparams	= DEFAULT_RPARAMS;

		init();
	}

	public PayWebHostVo(String _payKey ,String _rparams) {
		this.payKey		= _payKey;
		this.rparams	= _rparams;

		init();
	}

	private void init()
	{
		this.rnames  = split(this.rparams,DEFAULT_DELIM);
		this.rvHash  = new HashMap();
	}

	public String kspay_get_value(String pname)
	{
		if (pname == null || this.rnames == null) return null;
		return (String)rvHash.get(pname);
	}

	public boolean kspay_send_msg(String _mtype)
	{
		this.mtype = _mtype;
		String rmsg = send_url();
		if (rmsg.indexOf('`') != -1)
		{
			String[] tmpvals = split(rmsg,DEFAULT_DELIM);
			if (this.rnames.length < tmpvals.length)
			{
				for(int i=0; i<this.rnames.length; i++) rvHash.put(this.rnames[i],tmpvals[i+1]);
				return true;
			}
		}
		return false;
	}

    public String send_url()
    {
		URLConnection	httpConn	= null;
		BufferedReader	brd			= null;
		PrintStream		pout		= null;

		StringBuffer sb = new StringBuffer();
		try {
			String post_msg = sb.append("sndCommConId=").append(this.payKey).append("&sndActionType=").append(this.mtype).append("&sndRpyParams=").append(URLEncoder.encode(this.rparams,"utf-8")).toString();

			httpConn = new URL(KSPAY_WEBHOST_URL).openConnection();
			httpConn.setDoOutput(true);
			httpConn.setUseCaches(false);
			pout = new PrintStream (httpConn.getOutputStream(),false,"euc-kr");
			pout.print(post_msg);
			pout.flush();

			brd = new BufferedReader(new InputStreamReader(httpConn.getInputStream(),"euc-kr"));

			sb.setLength(0);
			String tmpStr = null;
			while( (tmpStr=brd.readLine())!= null ) {
				sb.append(tmpStr);
			}

			write_log("INFO :send_url("+this.payKey+","+this.mtype+","+this.rparams+") msg=["+sb.toString()+"]");
		}catch(Exception e)
        {
			write_log("ERROR:send_url("+this.payKey+","+this.mtype+","+this.rparams+") failed!!");
			write_log(e);
        }finally
        {
			try{if (pout     != null) pout     .close(); }catch(Exception e){} pout     = null;
			try{if (brd      != null) brd      .close(); }catch(Exception e){} brd      = null;
			httpConn = null;
        }

        return sb.toString();
    }

	public static String[] split(String srcStr, char c1)
	{
		return split(srcStr, String.valueOf(c1));
	}

	public static String[] split(String srcStr, String str1)
	{
		if (srcStr == null) return new String[0];

		String[] tokenArr = null;
		if (srcStr.indexOf(str1) == -1)
		{
			tokenArr = new String[1];
			tokenArr[0] = srcStr;

			return tokenArr;
		}

		LinkedList linkedlist = new LinkedList();

		int srcLength    = srcStr.length();
		int tockenLength = str1.length();

		int pos = 0, startPos = 0;
		while(startPos < srcLength)
		{
			pos = srcStr.indexOf(str1, startPos);

			if (-1 == pos) break;

			linkedlist.add(srcStr.substring(startPos, pos));
			startPos = pos + tockenLength;
		}

		if (startPos <= srcLength) linkedlist.add(srcStr.substring(startPos));

		return (String[])linkedlist.toArray(new String[0]);
	}

	public static String getCurrDate()
	{
		return getDate(0);
	}

	public static String getDate(int cday)
	{
		Calendar cal = Calendar.getInstance();

		if (cday != 0) cal.add(Calendar.DATE, cday);

		return getDate(cal);
	}

	public static String getDate(Calendar cal)
	{
		int li_yyyy,li_MM,li_dd,li_hour,li_min,li_sec;

		li_yyyy = cal.get(Calendar.YEAR); li_MM = cal.get(Calendar.MONTH); li_dd = cal.get(Calendar.DATE);
		li_hour = cal.get(Calendar.HOUR_OF_DAY); li_min = cal.get(Calendar.MINUTE); li_sec = cal.get(Calendar.SECOND);

		StringBuffer sb = new StringBuffer();

		sb.append(li_yyyy).append(li_MM<9 ? "0" : "").append(li_MM + 1).append(li_dd<10 ? "0" : "").append(li_dd);
		sb.append(li_hour<10 ? "0" : "").append(li_hour).append(li_min<10 ? "0" : "").append(li_min).append(li_sec<10 ? "0" : "").append(li_sec);

		return sb.toString();
	}

	public static void write_log(Object pstr)
	{
		String curr_date = getCurrDate();

		File log_dir = null;
		if (LOG_HOME_DIR != null && LOG_HOME_DIR.endsWith("/")) log_dir = new File(LOG_HOME_DIR);
		if (log_dir == null || !log_dir.exists())
		{
			write_log(System.out, pstr, curr_date);
			return;
		}

		StringBuffer sb = new StringBuffer();

		sb.append("kspay_").append(curr_date.substring(0,8)).append(".log");

		File openFile = new File(log_dir, sb.toString());
		PrintStream pout = null;

		try{
			if(openFile.exists()){
				pout = new PrintStream(new FileOutputStream(openFile, true), true);
			}else{
				pout = new PrintStream(new FileOutputStream(openFile), true);
			}
			write_log(pout, pstr, curr_date);
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			try{if (pout != null) pout.close(); }catch(Exception e){}
			pout     = null;
		}
	}

	private static void write_log(PrintStream pout, Object pstr, String curr_date)
	{
		StringBuffer sb = new StringBuffer();

		sb.append("[");
		sb.append(curr_date.substring(8,10)).append(":").append(curr_date.substring(10,12)).append(":").append(curr_date.substring(12,14));
		sb.append("] " );
		if (pstr instanceof Throwable)
		{
			pout.println(sb.toString());

			Throwable tw = (Throwable)pstr;
			tw.printStackTrace(pout);
			pout.println();
		}else
		{
			sb.append(pstr);

			pout.println(sb.toString());
		}
		pout.flush();
	}
}