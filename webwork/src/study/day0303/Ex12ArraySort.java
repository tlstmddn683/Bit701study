package study.day0303;

public class Ex12ArraySort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] data = { 3, 5, 4, 1, 2 };
		int temp;
		// selection sort-다중for문
		for (int i = 0; i < data.length - 1; i++) {
			for (int j = i + 1; j < data.length; j++) {
				if (data[i] > data[j]) {

					temp = data[i];
					data[i] = data[j];
					data[j] = temp;
				}
			}
		}
			// 출력
			for (int d : data) {
				System.out.println(d);
			}

		

	}
}
