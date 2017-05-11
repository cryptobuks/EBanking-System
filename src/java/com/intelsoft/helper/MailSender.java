/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.helper;



import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

public class MailSender
{
         String  d_email = "iamdvr@gmail.com",
            d_password = "****",
            d_host = "smtp.gmail.com",
            d_port  = "465",
            m_to = "iamdvr@yahoo.com",
            m_subject = "Testing",
            m_text = "Hey, this is the testing email using smtp.gmail.com.";
    public static void main(String[] args)
    {
                String[] to={"care.techbank@gmail.com"};
                String[] cc={"care.techbank@gmail.com"};
                String[] bcc={"care.techbank@gmail.com"};
                //This is for google
                MailSender.sendMail("care.techbank@gmail.com","Ch3coohm046524","smtp.gmail.com","465","true",
"true",true,"javax.net.ssl.SSLSocketFactory","false",to,cc,bcc,
"This is Test Email","This is the content of test email.","E:\\ImageTest\\Target.png","Target1.png");

    }

        public synchronized static boolean sendMail(String userName,String passWord,String host,String port,String starttls,String auth,boolean debug,String socketFactoryClass,String fallback,String[] to,String[] cc,String[] bcc,String subject,String text,String filePath,String destFileName){
                Properties props = new Properties();
                //Properties props=System.getProperties();
        props.put("mail.smtp.user", userName);
        props.put("mail.smtp.host", host);
                if(!"".equals(port))
        props.put("mail.smtp.port", port);
                if(!"".equals(starttls))
        props.put("mail.smtp.starttls.enable",starttls);
        props.put("mail.smtp.auth", auth);
                if(debug){
                props.put("mail.smtp.debug", "true");
                }else{
                props.put("mail.smtp.debug", "false");
                }
                if(!"".equals(port))
        props.put("mail.smtp.socketFactory.port", port);
                if(!"".equals(socketFactoryClass))
        props.put("mail.smtp.socketFactory.class",socketFactoryClass);
                if(!"".equals(fallback))
        props.put("mail.smtp.socketFactory.fallback", fallback);

        try
        {
                        Session session = Session.getDefaultInstance(props, null);
            session.setDebug(debug);
            MimeMessage msg = new MimeMessage(session);
            msg.setText(text);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress("rckr420@gmail.com"));
            for(int i=0;i<to.length;i++){
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
            }
            for(int i=0;i<cc.length;i++){
                msg.addRecipient(Message.RecipientType.CC, new InternetAddress(cc[i]));
            }
            for(int i=0;i<bcc.length;i++){
                msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(bcc[i]));
            }
//            msg.saveChanges();

            // create the message part
    MimeBodyPart messageBodyPart =
      new MimeBodyPart();

    //fill message
    messageBodyPart.setText("");

    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);

    // Part two is attachment
    MimeBodyPart messageBodyPart1 =
      new MimeBodyPart();
    messageBodyPart1 = new MimeBodyPart();
    DataSource source =
//      new FileDataSource("C:\\Documents and Settings\\All Users\\Documents\\My Pictures\\Sample Pictures\\Sunset.jpg");
            new FileDataSource(filePath);
    messageBodyPart1.setDataHandler(
      new DataHandler(source));
    messageBodyPart1.setFileName(destFileName);
    multipart.addBodyPart(messageBodyPart1);

    // Put parts in message
    msg.setContent(multipart);

                        Transport transport = session.getTransport("smtp");
                        transport.connect(host, userName, passWord);
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        return true;
        }
        catch (Exception mex)
        {
            mex.printStackTrace();
                        return false;
        }
        }

}

