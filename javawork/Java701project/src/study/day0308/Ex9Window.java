package study.day0308;

import java.awt.Color;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

import javax.swing.JFrame;

class MyHome extends JFrame implements WindowListener
{
	public MyHome(String title){
		super(title);
		this.setBounds(900, 100, 300, 300);//x,y,w,h
		//윈도우 색 변경
//		this.getContentPane().setBackground(Color.PINK);//color의 static 상수들을 이용해서 색상 변경
		//rgb 색상으로 프레임색으로 변경
		this.getContentPane().setBackground(new Color(234, 123,190));
		
		//윈도우 이벤트를 발생하려면
		this.addWindowListener(this);
		
		this.setVisible(true);//프레임이 보이게 하기
	}
	//windowListener 라는 인터페이스가 가진 추상 메소드들, 무조건 오버라이드 해야된다
	@Override
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowOpened");
	}

	@Override
	public void windowClosing(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("윈도우 종료");
		System.exit(0);//0: 정상종료시
	}

	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowIconified");
	}

	@Override
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	
}

public class Ex9Window {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyHome my=new MyHome("BitCamp");//생성자 호출
	}

}
