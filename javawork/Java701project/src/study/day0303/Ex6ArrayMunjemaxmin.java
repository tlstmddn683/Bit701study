package study.day0303;

public class Ex6ArrayMunjemaxmin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[]data= {100,78,67,190,-100,89,350,-290,78,200};
		int max=data[0];//첫 데이터를 max값으로 일단 주고 for문돌리기
		int min=data[0];
		for(int i=1;i<data.length;i++) 
		{
			if(max<data[i]) //더큰값이 있으면 
				max=data[i];//그값으로 맥스값 변경
			
			if(min>data[i]) 
				min=data[i];
			
		}
		System.out.println("max="+max);
		System.out.println("min="+min);
		
	}

}
