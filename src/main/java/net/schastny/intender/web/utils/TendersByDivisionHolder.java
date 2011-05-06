package net.schastny.intender.web.utils;

import java.util.List;

import net.schastny.intender.domain.Division;
import net.schastny.intender.domain.Tender;

public class TendersByDivisionHolder {
	
	private Division division;
	private List<Tender> tenders;
	
	public TendersByDivisionHolder(Division division, List<Tender> tenders) {
		super();
		this.division = division;
		this.tenders = tenders;
	}
	
	public Division getDivision() {
		return division;
	}
	public void setDivision(Division division) {
		this.division = division;
	}
	public List<Tender> getTenders() {
		return tenders;
	}
	public void setTenders(List<Tender> tenders) {
		this.tenders = tenders;
	}

}
