package com.kh.gogit.search.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.service.MemberServiceImpl;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.repository.model.vo.Repository;
import com.kh.gogit.search.model.service.SearchServiceImpl;
import com.kh.gogit.search.model.vo.Search;

import kotlin.reflect.TypeOfKt;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl sService;
	
	@RequestMapping("search.jm")
	public String test1(HttpSession session, Model model, String keyword) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		// JSON 응답을 받아옴
		String searchList = sService.test1(m, keyword,1);
		String repoTotalCount = sService.test1(m, keyword,0);
		
		String count = "";
		if(repoTotalCount != null) {	
			// 받아온 JSON 응답을 객체로 변환
			JsonParser parser = new JsonParser(); // JSON파싱을 위해 JsonParser객체를 생성
			JsonObject countObj = JsonParser.parseString(repoTotalCount).getAsJsonObject();
			count = countObj.get("total_count").getAsString();
		}
		
		// 객체를 담을 ArrayList를 생성
		ArrayList<Search> seList = new ArrayList<Search>();
		
		/*
		System.out.println("여기다" + searchList);
		
		ArrayList<Search> seList = new ArrayList<Search>();
		
		JsonElement element = JsonParser.parseString(searchList);
		// element는 어레이배열로도 객체로도 적재적소에 만들어줌 내가 가져온값이 뭔지 판단만해서!
		
		if(element.isJsonArray()) {
			// 데이터가 배열인 경우, 배열로 처리
			// 내가 원하는 속성들만 가져가야해서 파싱해야함
			JsonArray searchArr = JsonParser.parseString(searchList).getAsJsonArray();
			
			for(int i=0; i<searchArr.size(); i++) {
				// JsonObject searObj = searchArr.get(i).getAsJsonObject();
				
				Search se = new Search();
				se.setLogin(searchArr.get(i).getAsJsonObject().get("login").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setAvatarUrl(searchArr.get(i).getAsJsonObject().get("avatar_url").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setHtmlUrl(searchArr.get(i).getAsJsonObject().get("html_url").getAsString());
				se.setTotalCount(searchArr.get(i).getAsJsonObject().get("total_count").getAsString());
				se.setType(searchArr.get(i).getAsJsonObject().get("type").getAsString());
				
				seList.add(se);
			}	
		} else if(element.isJsonObject()) {
			// 데이터가 객체인 경우, 객체로 처리
			// 너객체냐? 그럼 파싱한값을 객체로 넣겠다
			JsonParser parser = new JsonParser();
			
			JsonObject seObj = parser.parse(searchList).getAsJsonObject(); // 가져왔던 객체를 파싱함
			JsonArray itemsArray = seObj.getAsJsonArray("items"); // 가져온 객체안에 있는 배열에 접근!
			
			// 배열안에 있는 객체에 접근해야함 이제부터
			JsonObject firstItem = itemsArray.get(0).getAsJsonObject();
			
			// 만들어진 객체의 속성값에 접근해서 그걸 스트링으로 만들어져서 변수에 담는다
			String login = firstItem.get("login").getAsString();

			
			System.out.println("뭐죠? 여기거든요?" + login);
			for (JsonElement elements : itemsArray) {
				Search se = new Search();
				se.setLogin(login); // getAsString 스트링으로 변환시켜주는 애
				se.setAvatarUrl(firstItem.get("avatar_url").getAsString()); // getAsString 스트링으로 변환시켜주는 애
				se.setHtmlUrl(firstItem.get("html_url").getAsString());
				se.setTotalCount(seObj.get("total_count").getAsString());
				se.setType(firstItem.get("type").getAsString());
				
				seList.add(se);
				
			}
		}else {
			System.out.println("객체도 배열도 아니면 뭐냐");
		}
		*/
		
		// 받아온 JSON 응답을 객체로 변환
		JsonParser parser = new JsonParser(); // JSON파싱을 위해 JsonParser객체를 생성
		JsonObject seObj = parser.parse(searchList).getAsJsonObject(); // 받아온 JSON 응답을 jsonObject로 변환
		JsonArray itemsArray = seObj.getAsJsonArray("items"); // JsonObject에서 "items"의 키값을 가져옴

		// 모든 아이템을 순회하며 객체를 생성
		for (JsonElement element : itemsArray) { // items 배열 다 순회하기
		    if (element.isJsonObject()) { // 각 요소가 JsonObject인지 확인
		        JsonObject item = element.getAsJsonObject(); // JsonObject로 변환
		        Search se = new Search();
		        se.setLogin(item.get("login").getAsString()); // JsonObject에서 "login" 키의 값을 가져와서 setLogin
		        se.setAvatarUrl(item.get("avatar_url").getAsString());
		        se.setHtmlUrl(item.get("html_url").getAsString());
		        se.setType(item.get("type").getAsString());
		        se.setTotalCount(seObj.get("total_count").getAsString());
		        seList.add(se);
		    }
		}
		
		// 다른방법)나머지 속성은 첫 번째 아이템의 값으로 설정
		//if (!seList.isEmpty()) { // 첫 번째 아이템의 "total_count" 속성 값을 가져와서 Search 객체의 totalCount에 설정
		    //Search firstItem = seList.get(0); // seList에서 첫 번째 요소를 가져와서 firstItem 변수에 할당
		    //firstItem.setTotalCount(seObj.get("total_count").getAsString());  // 첫 번째 요소인 firstItem의 total_count 값을 seObj에서 가져와서 설정함, 이 값은 JSON 응답에서 total_count 값임
		    
		    //for (Search searchItem : seList) { // for 루프 안에서 각 요소에 대해 total_count 값을 설정하고 있음, 이 부분이 for 루프 밖에서 total_count 값이 seList에 추가되는 것과 같은 효과를 줌
		        //searchItem.setTotalCount(seObj.get("total_count").getAsString());
		    //}
		//}	
		model.addAttribute("seList", seList)
		     .addAttribute("keyword", keyword)
		     .addAttribute("count", count);
		
		return "common/searchView";
	}
	
	@RequestMapping("search.jmm")
	public void test2(HttpSession session, Model model, String keyword, String page, HttpServletResponse response) throws JsonIOException, IOException {	
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchList = sService.test2(m, keyword, page);
		
		ArrayList<Search> seList = new ArrayList<Search>();
		
		JsonParser parser = new JsonParser(); 
		JsonObject seObj = parser.parse(searchList).getAsJsonObject();
		JsonArray itemsArray = seObj.getAsJsonArray("items");

		for (JsonElement element : itemsArray) { 
		    if (element.isJsonObject()) { 
		        JsonObject item = element.getAsJsonObject();
		        Search se = new Search();
		        se.setLogin(item.get("login").getAsString());
		        se.setAvatarUrl(item.get("avatar_url").getAsString());
		        se.setHtmlUrl(item.get("html_url").getAsString());
		        se.setType(item.get("type").getAsString());
		        se.setTotalCount(seObj.get("total_count").getAsString());
		        seList.add(se);
		    }
		}		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(seList, response.getWriter());
	}
	
	@RequestMapping("detail.sr")
	public String detailView(String nickName, String avatar, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		String searchUserContent = sService.userDetailView(nickName, m);
		JsonParser parser = new JsonParser(); 
		JsonArray userArr = JsonParser.parseString(searchUserContent).getAsJsonArray(); // 대괄호는 어레이로 파싱(올때 스트링형으로 오니까 jSonArray형으로 파싱을 해줘야 키값으로 값을 뽑을수 있기에 파싱을함)
		//JsonObject objuser = userArr.get(0).getAsJsonObject(); // 얘가 제이슨오브젝트, 어레이를 빼서 오브젝트로 만들어줌
		
		ArrayList<Search> list = new ArrayList<Search>();
		
		for (JsonElement element : userArr) { 
		    if (element.isJsonObject()) { 
		        JsonObject objuser = element.getAsJsonObject();
		        Search se = new Search();
				se.setName(objuser.get("name").getAsString());
				se.setVisibility(objuser.get("visibility").getAsString());
				se.setLanguage(objuser.get("language").isJsonNull() ? "" : objuser.get("language").getAsString());
				se.setDescription(objuser.get("description").isJsonNull() ? "" : objuser.get("description").getAsString());
		        list.add(se);
		    }
		}
		
		boolean isFollow = new MemberServiceImpl().checkFollow(m, nickName);

		model.addAttribute("nickName", nickName)
		.addAttribute("avatar", avatar)
		.addAttribute("list",list)
		.addAttribute("isFollow", isFollow);
		return "search/searchDetailView";
	}
	
	@RequestMapping("reposearch.jm")
	public String test2(HttpSession session, Model model, String keyword) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String repoList = sService.repoDetailView(keyword, m);
		//System.out.println(repoList);
		ArrayList<Search> list = new ArrayList<Search>();
		
		JsonParser parser = new JsonParser();
		JsonObject reObj = parser.parse(repoList).getAsJsonObject();
		JsonArray itemsArray = reObj.getAsJsonArray("items");
		
		
		// sonElement는 JSON 객체나 배열의 특정 속성이나 요소를 가져오는 데 사용
		for (JsonElement element : itemsArray) { // itemsArray에 있는 각 요소에 대해 반복문 실행
		    JsonObject item = element.getAsJsonObject(); // 현재 요소를 JsonObject로 변환하여 item에 할당
		    Search se = new Search(); // 새로운 Search 객체 생성
		    
		    // full_name 속성을 가져와서 Search 객체의 fullName 속성으로 설정
		    se.setFullName(item.get("full_name").getAsString());
		    se.setName(item.get("name").getAsString());
		    se.setVisibility(item.get("visibility").getAsString());
		    
		    se.setTotalCount(reObj.get("total_count").getAsString());
		    	   		  
		    // avatar_url 속성 처리
//		    JsonElement avatarUrlElement = item.get("avatar_url"); // avatar_url 속성 값 가져오기
//		    if (avatarUrlElement != null && !avatarUrlElement.isJsonNull()) { // 값이 null이 아닌 경우
//		        se.setAvatarUrl(avatarUrlElement.getAsString()); // Search 객체의 avatarUrl 속성으로 설정
//		    } else {
//		        se.setAvatarUrl(""); // 값이 null이거나 속성이 없는 경우 빈 문자열로 설정
//		    }
		    
		    JsonElement ownerElement = item.get("owner");
		    JsonObject ownerObject = ownerElement.getAsJsonObject();
		    
		    String avatarUrl = ownerObject.get("avatar_url").getAsString();
		    String login = ownerObject.get("login").getAsString();
		    se.setAvatarUrl(avatarUrl);
		    se.setLogin(login);
		    
		    // description 속성 처리
		    JsonElement descriptionElement = item.get("description"); // description 속성 값 가져오기
		    // 값이 null이 아니면서 JsonNull이 아닌 경우에만 값을 가져와서 Search 객체의 description 속성으로 설정
		    se.setDescription(descriptionElement != null && !descriptionElement.isJsonNull() ? descriptionElement.getAsString() : "");
		    
		    // topics 속성 처리
		    JsonArray topicsArray = item.getAsJsonArray("topics"); // topics 속성 값을 배열로 가져오기
		    StringBuilder topicsBuilder = new StringBuilder(); // 토픽을 문자열로 합치기 위한 StringBuilder 객체 생성
		    for (JsonElement topicElement : topicsArray) { // 토픽 배열을 반복하면서 각 토픽을 StringBuilder에 추가
		        topicsBuilder.append(topicElement.getAsString()).append(", ");
		    }
		    String topics = topicsBuilder.toString(); // StringBuilder를 문자열로 변환
		    if (topics.length() > 0) { // 토픽이 존재하는 경우
		        topics = topics.substring(0, topics.length() - 2); // 마지막 ", " 문자열 제거
		    }
		    se.setTopics(topics); // 합쳐진 토픽을 Search 객체의 topics 속성으로 설정
		    
		    // language 속성 처리
		    JsonElement languageElement = item.get("language"); // language 속성 값 가져오기
		    // 값이 null이 아니면서 JsonNull이 아닌 경우에만 값을 가져와서 Search 객체의 language 속성으로 설정
		    se.setLanguage(languageElement != null && !languageElement.isJsonNull() ? languageElement.getAsString() : "");
		    
		    // pushed_at 속성을 가져와서 Search 객체의 pushedAt 속성으로 설정
		    se.setPushedAt(item.get("pushed_at").getAsString().substring(0, 10));
		    
		    list.add(se); // 완성된 Search 객체를 리스트에 추가
		}
		
		model.addAttribute("list", list)
		     .addAttribute("keyword", keyword);
		return "search/searchRepoDetailView";
	}
	
	@RequestMapping("searchrepo.jmm")
	public void test4(HttpSession session, Model model, String keyword, String page, HttpServletResponse response) throws JsonIOException, IOException {
		Member m = (Member)session.getAttribute("loginUser");
				
		String searchRepoList = sService.test4(m, keyword, page);
		
		ArrayList<Search> seList = new ArrayList<Search>();
		
		JsonParser parser = new JsonParser();
		JsonObject reObj = parser.parse(searchRepoList).getAsJsonObject();
		JsonArray itemsArray = reObj.getAsJsonArray("items");
		
		// sonElement는 JSON 객체나 배열의 특정 속성이나 요소를 가져오는 데 사용
		for (JsonElement element : itemsArray) { // itemsArray에 있는 각 요소에 대해 반복문 실행
		    JsonObject item = element.getAsJsonObject(); // 현재 요소를 JsonObject로 변환하여 item에 할당
		    Search se = new Search(); // 새로운 Search 객체 생성
		    
		    // full_name 속성을 가져와서 Search 객체의 fullName 속성으로 설정
		    se.setFullName(item.get("full_name").getAsString());
		    se.setName(item.get("name").getAsString());
		    se.setVisibility(item.get("visibility").getAsString());		    
		    
		    JsonElement ownerElement = item.get("owner");
		    JsonObject ownerObject = ownerElement.getAsJsonObject();
		    
		    String avatarUrl = ownerObject.get("avatar_url").getAsString();
		    String login = ownerObject.get("login").getAsString();
		    se.setAvatarUrl(avatarUrl);
		    se.setLogin(login);
		    
		    // description 속성 처리
		    JsonElement descriptionElement = item.get("description"); // description 속성 값 가져오기
		    // 값이 null이 아니면서 JsonNull이 아닌 경우에만 값을 가져와서 Search 객체의 description 속성으로 설정
		    se.setDescription(descriptionElement != null && !descriptionElement.isJsonNull() ? descriptionElement.getAsString() : "");
		    
		    // topics 속성 처리
		    JsonArray topicsArray = item.getAsJsonArray("topics"); // topics 속성 값을 배열로 가져오기
		    StringBuilder topicsBuilder = new StringBuilder(); // 토픽을 문자열로 합치기 위한 StringBuilder 객체 생성
		    for (JsonElement topicElement : topicsArray) { // 토픽 배열을 반복하면서 각 토픽을 StringBuilder에 추가
		        topicsBuilder.append(topicElement.getAsString()).append(", ");
		    }
		    String topics = topicsBuilder.toString(); // StringBuilder를 문자열로 변환
		    if (topics.length() > 0) { // 토픽이 존재하는 경우
		        topics = topics.substring(0, topics.length() - 2); // 마지막 ", " 문자열 제거
		    }
		    se.setTopics(topics); // 합쳐진 토픽을 Search 객체의 topics 속성으로 설정
		    
		    // language 속성 처리
		    JsonElement languageElement = item.get("language"); // language 속성 값 가져오기
		    // 값이 null이 아니면서 JsonNull이 아닌 경우에만 값을 가져와서 Search 객체의 language 속성으로 설정
		    se.setLanguage(languageElement != null && !languageElement.isJsonNull() ? languageElement.getAsString() : "");
		    
		    // pushed_at 속성을 가져와서 Search 객체의 pushedAt 속성으로 설정
		    se.setPushedAt(item.get("pushed_at").getAsString().substring(0, 10));
		    
		    seList.add(se); // 완성된 Search 객체를 리스트에 추가
		}	
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(seList, response.getWriter());
		
	}
	
	@RequestMapping("permi.pr")
	public String permiSelect(HttpSession session, Model model, String repoName, String visibility, String owner) {
		Member m = (Member)session.getAttribute("loginUser");
		
		String repoList = sService.test5(m, repoName, visibility, owner);
		
		String permission = "";
		JsonParser parser = new JsonParser();
		JsonObject perObj = JsonParser.parseString(repoList).getAsJsonObject();
		permission = perObj.get("permissions").getAsJsonObject().get("push").getAsString();
				
		return "redirect:detail.rp?repoName=" + repoName + "&visibility=" + visibility +"&owner="+ owner + "&permission=" + permission;
	}
}
