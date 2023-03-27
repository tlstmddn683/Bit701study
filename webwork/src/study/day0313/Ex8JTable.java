package study.day0313;

import java.awt.Color;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Ex8JTable extends JFrame {
	
	JTable table1,table2,table3;
	
	public Ex8JTable(String title) {
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
		this.setLayout(new GridLayout(3,1));//3행 1열의 그리드 레이아웃으로 변경
		//table1
		String []title1= {"이름","주소","나이"};
		String [][]data1= {{"이지영","서울","23세"},{"홍길동","대구","35세"},{"강철수","부산","29세"}};
		table1=new JTable(data1,title1);
		this.add(table1);
		
		table2=new JTable(data1, title1);
		this.add(new JScrollPane(table2));
		DefaultTableModel model=new DefaultTableModel(data1,title1);
		table3=new JTable(model);
		this.add(new JScrollPane(table3));
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Ex8JTable("Table");
	}

}
