package com.ds.service;

import java.util.*;

import javax.inject.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.service.*;

@Component
public class MailService {

	@Autowired
	protected JavaMailSender mailSender;
	
	// 아이디찾기
		public String SendId(String mem_id, String mem_email) {
			String subject = "";
			String text = "";
			String getRandomPassword = getRandomPassword(); 
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_id", mem_id);
			map.put("mem_email", mem_email);
			MimeMessage msg = mailSender.createMimeMessage();
			subject = mem_id + "님  TravelPlan  비밀번호 찾기 입니다.";
			text = mem_id + "님의 비밀번호는" + getRandomPassword + "입니다";
			try {
				msg.setSubject(subject);
				msg.setText(text);
				msg.setRecipient(RecipientType.TO, new InternetAddress(mem_email));
				mailSender.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			return getRandomPassword;
		};
		//랜덤 비밀번호 생성
		public String getRandomPassword(){
	        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k',
	        		'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	        		'0','1','2','3','4','5','6','7','8','9'};
	        
	        StringBuilder sb = new StringBuilder("");
	        Random rn = new Random();
	        for( int i = 0 ; i < 8 ; i++ ){
	            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
	        }
	        return sb.toString();
	    }


	
}
