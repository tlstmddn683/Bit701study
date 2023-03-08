package study.day0303;

public class Ex11ArrayRank {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[]score= {90,89,67,89,100};
		int[]rank= new int[5];
		
		//등수 구하기, 동점인경우 동순위
		for(int i=0;i<score.length;i++) {
			rank[i]=1;//rank초기값
			for(int j=0;j<score.length;j++) {
				//i(기준)번지 점수 보다 j(비교대상) 번지 점수가 더 높을 경우
				//i번지의 등수를 +1증가시킨다
				if(score[i]<score[j])
					rank[i]++;
			}
		}
	
		
		
		//출력
		System.out.println("점수\t등수");
		System.out.println("=".repeat(30));
		for(int i=0;i<score.length;i++) {
			System.out.println(score[i]+"점\t"+rank[i]+"등");
		}
	}

}
