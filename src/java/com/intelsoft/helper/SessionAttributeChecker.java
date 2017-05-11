/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.helper;

import javax.servlet.http.HttpSession;


public class SessionAttributeChecker {

    public static final String USER_ID="UserID";
    public static final String IS_AUTHORISED="IS_Authorised";
    public static boolean isAtributePresentInSession(HttpSession session, String key){
        boolean isPresent=false;
        if(session != null){
            if(session.getAttribute(key) != null){
                isPresent=true;
            }
        }
        return isPresent;
    }

    public static boolean getValueOfIS_AUTHORISEDInSession(HttpSession session){
        boolean isPresent=false;
        if(session != null){
            String val=(String)session.getAttribute(IS_AUTHORISED);
            if(val != null && Boolean.parseBoolean(val)){
                isPresent=true;
            }
        }
        return isPresent;
    }
}
