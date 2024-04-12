package com.kh.gogit.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {

	@RequestMapping("List.rp")
	public String repositoryList() {
		return "repository/repositoryList";
	}
	
	@RequestMapping("enrollForm.rp")
	public String repoEnrollForm() {
		return "repository/repositoryEnrollForm";
	}
		
	@RequestMapping("list.pullrq")
	public String pullRequestList() {
		return "repository/pullRequestList";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequestForm() {
		return "repository/pullRequestEnroll";
	}
	
}
