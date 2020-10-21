package com.project.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{ 
	@Override 
	protected PasswordAuthentication getPasswordAuthentication(){ 
		return new PasswordAuthentication("joygajoy22@gmail.com","Maroon5321"); 
	} 
}


