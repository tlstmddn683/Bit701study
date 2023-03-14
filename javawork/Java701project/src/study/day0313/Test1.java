package study.day0313;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Test1 extends JFrame {
	JButton btn1;
	JButton btn2;
	JLabel lblMessage;
	
	public Test1(String title) {
		// TODO Auto-generated constructor stub
		super(title);
		
		
		
		//단순히 윈도우만 종료하고 싶을 경우 메서드를 이용해서 종료한다
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//컴포넌트 생성 및 이벤트 설정하기 위한 메서드
		this.initDesign();
		
		this.getContentPane().setBackground(new Color(100,100,100));
		this.setBounds(900,100,300,300);//x y w h
		this.setVisible(true);
	}
	private void initDesign() {
		// TODO Auto-generated method stub
		
		JPanel North= new JPanel();
		
		btn1 =new JButton("버튼1 입니다");
		btn2 =new JButton("버튼2 입니다");
		

		lblMessage=new JLabel("Hello~~",JLabel.CENTER);
		lblMessage.setOpaque(true);
		lblMessage.setBackground(Color.green);
		lblMessage.setForeground(Color.LIGHT_GRAY);
		lblMessage.setFont(new Font("Comic Sans MS",Font.BOLD,30));
		
		
		North.add(btn1);
		North.add(btn2);
		
		this.add("North",North);
		this.add("Center",lblMessage);
		
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				lblMessage.setText("Button1 Click");
				lblMessage.setBackground(Color.ORANGE);
				lblMessage.setForeground(Color.WHITE);
			}
		});
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				lblMessage.setText("Button2 Click");
				lblMessage.setBackground(new Color(140,50,30));
				lblMessage.setForeground(new Color(155,200,70));
			}
		});
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Test1("버튼!!");
	
	
	}
}