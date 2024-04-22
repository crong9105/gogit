package com.kh.gogit.commit.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Commit {

	private String sah;
	private String author;
	private String commitDate;
	private String avatarUrl;
	private String message;
	
}