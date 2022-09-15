package com.Gift.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.Gift.models.HelpDesk;
import com.Gift.repos.HelpDeskRepository;

@Service
public class HelpDeskService {

	@Autowired HelpDeskRepository hrepo;
	@Autowired CustomerService custsrv;
	
	public void saveRequest(HelpDesk req) {
		hrepo.save(req);
	}
	
	public HelpDesk findRequestById(int id) {
		return hrepo.findById(id).get();
	}
	
	public void deleteRequestById(int id) {
		HelpDesk hd= hrepo.findById(id).get();
		hrepo.delete(hd);
	}
	
	public List<HelpDesk> getAllRequest(){
		return hrepo.findAll(Sort.by(Direction.DESC,"id"));
	}
	
	public List<HelpDesk> getPendingRequest(){		
		return hrepo.findByStatusOrderByIdDesc("Pending");
	}
	
	public List<HelpDesk> getUserRequest(String userid){
		return hrepo.findByUseridOrderByIdDesc(userid);
	}
}
