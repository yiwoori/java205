package ex;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class IteratorTest {

	public static void main(String[] args) {
	//ArrayList<String> list = new ArrayList<Sting>();
	List<String> list = new ArrayList<String>();
	
	//요소 저장 : add(T t)
	list.add("First");
	list.add("Second");
	list.add("Third");
	list.add("Fourth");
	
	//정렬방법
	for(int i=0; i<list.size(); i++) {
		System.out.println(list.get(i));
	}
	
	System.out.println("-----------------------------");
	
	for(String str : list) {
		System.out.println(str);
	}
	
	System.out.println("-----------------------------");
	
	Iterator<String> itr = list.iterator();
	while(itr.hasNext()) { //다음 요소 확인
		String currentStr = itr.next();//요소 가져오기
		System.out.println(currentStr);
	}
	
	}
}
