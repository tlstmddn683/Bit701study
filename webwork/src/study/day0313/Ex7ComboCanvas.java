package study.day0313;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Ex7ComboCanvas extends JFrame {
	MyPhoto my=new MyPhoto();
	Image image;
	String imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\19.jpg";//초기이미지
	JComboBox<String> combo;
	
	
	
	public Ex7ComboCanvas(String title) {
		// TODO Auto-generated constructor stub
		super(title);
		
		
		
		//단순히 윈도우만 종료하고 싶을 경우 메서드를 이용해서 종료한다
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//컴포넌트 생성 및 이벤트 설정하기 위한 메서드
		this.initDesign();
		
		this.getContentPane().setBackground(new Color(100,100,100));
		this.setBounds(900,100,300,400);//x y w h
		this.setVisible(true);
	}
	private void initDesign() {
		// TODO Auto-generated method stub
		//image생성
		image=new ImageIcon(imageName).getImage();
		this.add("Center", my);//Canvas
		String []data= {"수지","신세경","박보영","강동원","신민아","약쟁이"};
		combo=new JComboBox<>(data);
		
		JPanel p=new JPanel();
		p.add(combo);
		this.add("North",p);
		//combo이벤트
		combo.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent e) {
				// TODO Auto-generated method stub
//				System.out.println(combo.getSelectedIndex());
//				System.out.println(combo.getSelectedItem());
			
				switch(combo.getSelectedIndex()) {
				case 0:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\19.jpg";
					break;
				case 1:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\18.jpg";
					break;
				case 2:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\12.jpg";
					break;
				case 3:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\9.jpg";
					break;
				case 4:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\17.jpg";
					break;
				case 5:
					imageName="D:\\Bit701Naver\\webwork\\image\\moviestar\\20.jpg";
					break;
				}
					//image 얻기
					image = new ImageIcon(imageName).getImage();
					//paint 얻기
					my.repaint();
				}
			});
		}
		
		
	
	class MyPhoto extends Canvas
	{
		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub
			super.paint(g);
			//이미지 그리기
			g.drawImage(image, 0, 0, 300, 340, this); 
			//문자열 출력
			g.setFont(new Font("Impact",Font.ITALIC|Font.BOLD,35));
			g.setColor(Color.magenta);
			g.drawString("BitCamp 701 Class",5,200);
			
			
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Ex7ComboCanvas("이미지 선택");
		
	}

	}
