package study3;

public class MyShop {
	private String sangpum;
	private int su;
	private int dan;
	
	public MyShop(String sangpum) {
		// TODO Auto-generated constructor stub
		this.sangpum=sangpum;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	void showShop() {
		// TODO Auto-generated method stub
		System.out.println("��ǰ��: "+sangpum);
		System.out.println("����: "+su);
		System.out.println("�ܰ�: "+dan);
	}
}
