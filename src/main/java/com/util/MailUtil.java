package com.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	
	public  void mailSend(String title,String content,String userId) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		Authenticator auth = new SMTPAuthenticator();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("zzangkjw1@naver.com", "애플마켓"));
			InternetAddress to = new InternetAddress(userId);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(title, "UTF-8");
			msg.setText(content, "UTF-8");
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		} 
	}
}

//발송메일 컨트롤
class SMTPAuthenticator extends Authenticator{
	protected PasswordAuthentication getPasswordAuthentication() {
		String mail_id = "zzangkjw1@naver.com";
		String mail_pw = "rkdWJDdn12";
		return new PasswordAuthentication(mail_id,mail_pw);
	}
}



