package net.schastny.intender.security;

import net.schastny.intender.service.DivisionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.AccessDecisionVoter;

import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DivManagerVoter implements AccessDecisionVoter {
	
	@Autowired
	private DivisionService divisionService;

	public boolean supports(ConfigAttribute attribute) {
		return attribute.getAttribute() != null
				&& attribute.getAttribute().equals("ROLE_MANAGER");
	}

	public boolean supports(Class clazz) {
		boolean result = false;
		if (clazz.getName().equals("org.springframework.security.web.FilterInvocation")){
			result = true;
		}
		return result;
	}

	public int vote(Authentication authentication, Object object, Collection<ConfigAttribute> configList) {
		Object principal = authentication.getPrincipal();
		if ( !(principal instanceof User) || !(object instanceof FilterInvocation) ){
			return ACCESS_DENIED;
		}
		
		int returnResult = ACCESS_GRANTED;
		
		// Get user and webFilter objects
		User user = (User) principal;
		String userName = user.getUsername();
		FilterInvocation webFilter = (FilterInvocation) object;
		
		// Parse request string, get divId integer value
		// Here we care only about /admin/{divId}/ strings
		Pattern p = Pattern.compile("/admin/(\\d)+");
		Matcher m = p.matcher(webFilter.getRequestUrl());
		while (m.find()){
			String divIdString = m.group().substring(7);
			int divId = Integer.parseInt(divIdString);
			if (divisionService.showDivision(divId) != null && !divisionService.showDivision(divId).getManagerEmail().equals(userName)){
				returnResult = ACCESS_DENIED;
			}
		}
		
		// Only admin is allowed to create new divisions
		if ( webFilter.getRequestUrl().equals("/admin/division/store") ){
			String divIdString = webFilter.getHttpRequest().getParameter("id");
			int divId = Integer.parseInt(divIdString);
			
			// Check if manager is allowed to save this division
			if (divisionService.showDivision(divId) != null && !divisionService.showDivision(divId).getManagerEmail().equals(userName)){
				returnResult = ACCESS_DENIED;
			}
			
			// Check if it is a new division creation
			if (divId == 0 && !userName.equals("admin")){
				returnResult = ACCESS_DENIED;
			}
		}
		
		// TODO Если изменить скрытые поля, то можно сохранить свой тендер в другую категорию (это нужно исправить)
		// Only admin is allowed to create new divisions
//		if ( webFilter.getRequestUrl().equals("/admin/tender/store") ){
//			String divIdString = webFilter.getHttpRequest().getParameter("id");
//			int divId = Integer.parseInt(divIdString);
//		}
		
		return returnResult;
	}
}
