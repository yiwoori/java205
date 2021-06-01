package First;

class Modifier {
	
	private int prv;	//같은 패키지
			int dft;	//같은 클래스
	protected int prt;	//같은 패키지+자손(다른 패키지)
	public 	int pub;	//접근제한 없음 
	
	public void printMembers() {
		System.out.println(prv);	//OK
		System.out.println(dft);	//OK
		System.out.println(prt);	//OK
		System.out.println(pub);	//OK
	}

}
	
public class ModifierTest {
	public static void main(String[] args) {
		
		Modifier m = new Modifier();
		//System.out.println(m.prv);	//에러
		System.out.println(m.dft);	//OK
		System.out.println(m.prt);	//OK
		System.out.println(m.pub);	//OK
		
	}
	
}

