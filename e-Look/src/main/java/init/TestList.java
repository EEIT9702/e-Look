package init;

import java.util.LinkedList;
import java.util.List;

public class TestList {

	public static void main(String[] args) {
		List<String> list = new LinkedList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		list.remove(2);
		System.out.println(list.size());
		for(int i = 0 ;i<list.size();i++){
			System.out.println(list.get(i)+" i= "+i);
		}
		for(String a:list){
			System.out.println(a);
		}
	}

}
