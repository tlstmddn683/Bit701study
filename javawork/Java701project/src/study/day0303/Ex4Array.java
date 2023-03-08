package study.day0303;

public class Ex4Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [][]arr=new int[3][3];
		 //0 1 2 
		//0
		//1
		//2
	
		
		arr[0][0]=5;//1행 1열 
		arr[1][1]=10;//2행 2열
		arr[2][2]=15;//3행 3열
		
		System.out.println("행갯수:"+arr.length);
		System.out.println("0번행의 열갯수:"+arr[0].length);
		
		System.out.println("2차원 데이터 출력");
		for(int i=0;i<arr.length;i++) {
			for(int j=0;j<arr[i].length;j++) {
				System.out.printf("%5d",arr[i][j]);
				
			}
			System.out.println();
			
		}
	}

}
