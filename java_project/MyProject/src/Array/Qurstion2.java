package Array;
public class Qurstion2 {
	public static void addOneDArr(int[][] arr, int add) {
		for(int i=0; i<arr.length; i++) {
			System.out.print("arr["+i+"] = ");
			
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] += add;
				System.out.print(arr[i][j]+" ");
			} System.out.println();
		}
	}
	
	
	
	public static void main(String[] args) {

		int[][] arr = {
				{1,2,3}, {4,5}, {6,7,8,9}
		};
		addOneDArr(arr, 1);
	}
}