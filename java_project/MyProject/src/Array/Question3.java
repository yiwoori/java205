package Array;

//다음의 형태로 표현된 2차원 배열이 존재한다고 가정해보자
// 1 2 3
// 4 5 6
// 7 8 9
//이러한 형태를 갖는 int형 2차원 배열이 인자로 전달되면,
//다음의 형태로 배열의 구조를 변경시키는 메서드를 정의해보자
// 7 8 9
// 1 2 3
// 4 5 6
//즉, 총 n행으로 이루어진 2차원 배열이 존재한다면,
//메서드 호출시, 1행은 2행으로 이동이 이루어져야 한다.
//배열의 가로, 세로 길이에 상관 없이 동작을 하도록 메서드가 정의되어야 한다

public class Question3 {
	
	public static void arr(int[][] arr) {
		
		int[] arrTem = {};
		for(int i=0; i<arr[i].length; i++) {
			arrTem = arr[0];
			arr[0] = arr[1];
			arr[arr.length-1] = arrTem;
		} //System.out.println(arr[i]);
		
	}
	
	
	
	public static void main(String[] args) {
		
		int[][] arr = {
				{1,2,3}, {4,5}, {6,7,8,9}
		};
		arr(arr);
		
		
	}
}








