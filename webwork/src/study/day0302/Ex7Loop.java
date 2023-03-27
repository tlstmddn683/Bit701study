package study.day0302;

public class Ex7Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//5행 5열 *표 출력
		for(int i=1;i<=5;i++) {
			for(int j=1;j<=5;j++) {
				System.out.print("*");
				
			}
			System.out.println();
		}
		
		System.out.println("=".repeat(20));
		/*
		 * 				*
		 * 				**
		 * 				***
		 * 				****
		 * 				*****
		 */
		
		
		for(int i=1;i<=5;i++) {
			for(int j=1;j<=i;j++) {
				
				System.out.print("*");
			}
			System.out.println("");
		}
		System.out.println("=".repeat(20));
		/*
		 * 				*****	
		 * 			    ****	
		 * 		   	    ***  
		 * 			    ** 
		 * 				*		
		 * 
		 * 
		 */
		for(int i=1;i<=5;i++) {
//			for(int j=5;j>=i;j--) {
			for(int j=i;j<=5;j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
		System.out.println("=".repeat(20));
	}

}
