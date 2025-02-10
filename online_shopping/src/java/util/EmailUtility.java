/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.security.SecureRandom;


public class EmailUtility {
    private static final String FROM_EMAIL = "nguyenthanhluan151204@gmail.com";
    private static final String APP_PASSWORD = "uipi lvkv wzft xtrv";
    
    public static void sendOTP(String to, String otp) throws MessagingException {
    

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM_EMAIL));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject("Mã OTP xác nhận đăng ký");
        msg.setText("Mã OTP của bạn là: " + otp);

        Transport.send(msg);
    }
    
    public static void sendPassword(String to,String newPassword) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM_EMAIL));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject("Khôi phục mật khẩu tài khoản");
        msg.setText("Mật khẩu mới của bạn là: " + newPassword + "\nVui lòng đăng nhập và đổi lại mật khẩu.");

        Transport.send(msg);
        System.out.println("Mật khẩu mới đã được gửi đến " + to);
    }

}
