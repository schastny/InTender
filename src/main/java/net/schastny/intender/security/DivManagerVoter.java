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
		FilterInvocation webFilter = (FilterInvocation) object;
		
		// Parse request string, get divId integer value
		// Here we care only about /admin/{divId}/ strings
		Pattern p = Pattern.compile("/admin/(\\d)+");
		Matcher m = p.matcher(webFilter.getRequestUrl());
		System.out.println(webFilter.getRequestUrl());
		while (m.find()){
			String divIdString = m.group().substring(7);
			int divId = Integer.parseInt(divIdString);
			if (divisionService.showDivision(divId) != null && !divisionService.showDivision(divId).getManagerEmail().equals(user.getUsername())){
				returnResult = ACCESS_DENIED;
			}
		}
		return returnResult;
	}
}
