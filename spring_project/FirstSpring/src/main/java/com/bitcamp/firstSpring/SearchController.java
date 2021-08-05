package com.bitcamp.firstSpring;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.firstSpring.domain.*;

@Controller
public class SearchController {
	
	@RequestMapping("/search/search")
	public String search() {
		return "search/search";
	}
	
	@RequestMapping("/search/search1")
	public String search1() {
		return "search/search";
	}	//search()와 search1() 같은 페이지 응답 : 아래에서 정의한 @ModelAttribute의 내용을 공유함
	
	@ModelAttribute("searchTypeList")
	public List<SearchType> getSerSearchType() {
		
		List<SearchType> list = new ArrayList<SearchType>();
		list.add(new SearchType(1, "팀이름+선수이름"));
		list.add(new SearchType(2, "팀이름"));
		list.add(new SearchType(3, "선수이름"));
		
		return list;
	}
	
	@ModelAttribute("queryList")
	public String[] getQueryList() {
		return new String[] {"손흥민", "이강인", "메시"};
	}

}
