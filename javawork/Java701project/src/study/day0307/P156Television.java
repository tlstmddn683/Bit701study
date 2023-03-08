package study.day0307;
class Television
{
	private int channel;
	private int volume;
	private boolean onOff;
	
	Television(int c, int v, boolean o){
		channel=c;
		volume=v;
		onOff=o;
	}
	void print() {
		System.out.println("채널은"+channel+"이고 볼륨은 "+volume+"입니다");
		
	}
}
public class P156Television {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Television myTv=new Television(7,10,true);
		myTv.print();
		Television yourTv=new Television(12,8,true);
		yourTv.print();
	}

}
