package study.day0303;

public class Ex3Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arr1 = { 34, 56, 78, 99, 100 };
		double[] arr2 = { 1.2, 2.3, 3.4, 4.5, 5.6 };
		System.out.println(arr1.length);
		System.out.println(arr2.length);

		for (int i = 0; i < arr1.length; i++) {
			System.out.printf("%5d", arr1[i]);

		}
		System.out.println();
		for (int a : arr1) {
			System.out.printf("%5d", a);

		}
		System.out.println();
		System.out.println("=".repeat(35));

		for (int i = 0; i < arr2.length; i++) {
			System.out.printf("%6.1f", arr2[i]);

		}
		System.out.println();
		for (double a : arr2) {
			System.out.printf("%6.1f", a);
		}
		System.out.println();
		System.out.println("=".repeat(35));

	}

}
