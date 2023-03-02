package study.day0228;

public class Ex5Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//증감연산자++ --
		//a++ ++a: 단항으로 사용시 전치,후치 모두같음
		//다른 연산자와 사용시 전치는 1순위, 후치는 끝순위
		int a,b,m,n;
		a=b=5;
		++a;
		b++;
		System.out.printf("a=%d,b=%d\n",a,b);//둘다 6
		
		m=++a*3;//a가 먼저 증가후 3을 곱한값을 m에 대입  7*3
		n=b++*3;//3을 먼저 곱하고 m에 대입후 b가 증가    6*3
		System.out.printf("a=%d,b=%d,m=%d,n=%d\n",a,b,m,n);//7,7,21,18
		
		a=b=3;
		System.out.println(a++);//출력후 증가 3
		System.out.println(++b);//증가후 출력 4
		
	}

}
