package study.day0303;

public class Ex2Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String []names=new String[5];//null로 초기화값
		int []scores=new int[5];//0으로 초기화값
		
		//데이터 넣기
		names[0]="유재석";
		scores[0]=55;
		names[1]="박명수";
		scores[1]=66;
		names[2]="정준하";
		scores[2]=77;
		names[3]="정형돈";
		scores[3]=88;
		names[4]="하하";
		scores[4]=99;
		
		for(int i=0;i<names.length;i++) {
			System.out.println(names[i]+"\t"+scores[i]);
		}
	}

}
