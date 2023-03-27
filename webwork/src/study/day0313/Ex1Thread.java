package study.day0313;

public class Ex1Thread extends Thread{
	int num;
	String threadName;
	
	public Ex1Thread(String threadName ,int num) {
		// TODO Auto-generated constructor stub
		this.threadName=threadName;
		this.num=num;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=1;i<=num;i++)
		{
			System.out.println(threadName+"=>"+i);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex1Thread ex1=new Ex1Thread("one-thread",500);
		Ex1Thread ex2=new Ex1Thread("two-thread",500);
		Ex1Thread ex3=new Ex1Thread("three-thread",500);
		//Thread 에서는 run 호출이 start()
		ex1.start();
		ex2.start();
		ex3.start();
	}

}
