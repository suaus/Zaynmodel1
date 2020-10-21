package com.project.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{ 
	@Override 
	protected PasswordAuthentication getPasswordAuthentication(){ 
		return new PasswordAuthentication("p2a2m@svk.jp","1234"); 
	} 
}


