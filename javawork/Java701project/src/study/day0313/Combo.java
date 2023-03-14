package study.day0313;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;

import study.day0313.Ex7ComboCanvas.MyPhoto;

public class Combo extends JFrame {
	result re = new result();
	Image image;
	Color selColor;
	String seltype;
	JComboBox<String> combo1;
	JComboBox<String> combo2;

	public Combo(String title) {
		// TODO Auto-generated constructor stub
		super(title);

		// 단순히 윈도우만 종료하고 싶을 경우 메서드를 이용해서 종료한다
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// 컴포넌트 생성 및 이벤트 설정하기 위한 메서드
		this.initDesign();

		this.getContentPane().setBackground(Color.gray);
		this.setBounds(900, 100, 600, 600);// x y w h
		this.setVisible(true);
	}

	private void initDesign() {
		// TODO Auto-generated method stub

		image = new ImageIcon("D:\\Bit701Naver\\webwork\\image\\moviestar\\19.jpg").getImage();
		JPanel p = new JPanel();
		
		String[] A = { "빨강", "파랑", "초록", "검정" };
		combo1 = new JComboBox<>(A);
		String[] B = { "원", "사각형", "사진", "문자열" };
		combo2 = new JComboBox<>(B);

		p.add(combo1);
		p.add(combo2);
		
		this.add("North", p);
		this.add("Center", re);

		combo1.addItemListener(new ItemListener() {

			@Override
			public void itemStateChanged(ItemEvent e) {
				// TODO Auto-generated method stub
				switch (combo1.getSelectedIndex()) {
				case 0:
					selColor=Color.RED;
					break;
				case 1:
					selColor=Color.BLUE;
					break;
				case 2:
					selColor=Color.GREEN;	
					break;
				case 3:
					selColor=Color.BLACK;
					break;
				}
				re.repaint();
				
			}
		});
		combo2.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent e) {
				// TODO Auto-generated method stub
				switch (combo2.getSelectedIndex()) {
				case 0:
					seltype="circle";
					break;
				case 1:
					seltype="square";
					break;
				case 2:
					seltype="image";
					break;
				case 3:
					seltype="String";
					break;
				}
				re.repaint();
			}
		});
	}

	class result extends Canvas {

		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub
			super.paint(g);
			
			g.setColor(selColor);
			if(seltype =="circle") {
				g.fillOval(200,200,200,200);
				
			}else if (seltype =="square") {
				g.fillRect(200,200,200,200);
				
			}else if (seltype =="image") {
				g.drawImage(image,150,100,300,400,this);
			}else if(seltype == "String") {
				g.setFont(new Font("Impact",Font.ITALIC|Font.BOLD,35));
				g.drawString("Hello~~~~!",100,100);
			}
		}
			
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Combo("예제");
	}

}
