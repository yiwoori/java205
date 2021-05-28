package Array;

class ArryEx4 {
	public static void main(String[] args) {
		
		//45개 정수 값을 저장하기 위한 배열 생성
		int[] ball = new int[45];
		
		//배열의 각 요소에 1~45의 값을 저장
		for(int i=0; i<ball.length; i++) {
			ball[i] = i+1;
		}
		
		int temp = 0;
		int j = 0;
		
		//배열에 저장된 값이 잘 섞이도록 충부히 큰 반복횟수를 지정
		//배열의 첫번째 요소와 임의의 요소에 저장된 값을 서로 바꿔서 값을 섞는다.
		for(int i=0; i<1000; i++) {
			j=(int)(Math.random()*45); //배열 범위(0~44)의 임의의 값
			
			temp = ball[0];
			ball[0] = ball[j];
			ball[j] = temp;
			
		}
		for(int i=0; i<6; i++) {
			System.out.println(ball[i]);
		}
		
		
		
		
	}
}
