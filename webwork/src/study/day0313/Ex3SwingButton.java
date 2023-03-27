package study.day0313;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Ex3SwingButton extends JFrame {
	JButton btn1 = new JButton("버튼1");
	JButton btn2;
	JLabel lblMessage;

	public Ex3SwingButton(String title) {
		// TODO Auto-generated constructor stub
		super(title);

		// 단순히 윈도우만 종료하고 싶을 경우 메서드를 이용해서 종료한다
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// 컴포넌트 생성 및 이벤트 설정하기 위한 메서드
		this.initDesign();

		this.getContentPane().setBackground(new Color(100, 100, 100));
		this.setBounds(900, 100, 300, 300);// x y w h
		this.setVisible(true);
	}

	private void initDesign() {
		// TODO Auto-generated method stub
		// 버튼, 체크박스 등등을 컴포넌트라 부른다
		// 버튼을 추가할 프레임이나 다이얼로그 등등을 컨테이너라고 부른다

		// 컴포넌트를 컨테이너에 추가하는 메서드 add를 통해서 부착한다
		// 기본레이아웃이 설정:Border-Layout-상,하,좌,우,센터
//		this.add("North",btn1);
		this.add(btn1, BorderLayout.NORTH);
		btn2 = new JButton("버튼2");
//		this.add("South",btn2);
		this.add(btn2, BorderLayout.SOUTH);
		// center에는 라벨을 생성해서 넣어보자
		lblMessage = new JLabel("Have a Nice Day", JLabel.CENTER);
		lblMessage.setOpaque(true);// 불투명, 기본은 false:투명
		lblMessage.setBackground(Color.YELLOW);
		lblMessage.setForeground(Color.GREEN);
		lblMessage.setFont(new Font("Comic Sans MS", Font.BOLD, 30));
		this.add("Center", lblMessage);

		// 익명 내부 클래스 형태로 버튼 이벤트 주기
		btn1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				lblMessage.setText("Button1 Click");
				lblMessage.setBackground(Color.BLUE);
				lblMessage.setForeground(Color.WHITE);
			}
		});
		btn2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				lblMessage.setText("Button2 Click");
				lblMessage.setBackground(new Color(255, 55, 100));
				lblMessage.setForeground(new Color(140, 60, 90));
			}
		});
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Ex3SwingButton("버튼생성");
	}

}
