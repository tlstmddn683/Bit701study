package study.day0308;
class Shape{
	protected int x,y;
	public void draw() {
		System.out.println("Shape Draw");
		
	}
}
class Rectangle extends Shape
{
	private int width,height;
	public void draw(){
		System.out.println("Rectangle Draw");
	}
}
class Triangle extends Shape
{
	private int base,height;
	public void draw() {
		System.out.println("Triangle Draw");
		
	}
}
class Circle extends Shape
{
	private int radius;
	public void draw() {
		
		System.out.println("Circle Draw");
	}
}
public class Munje1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Shape s1,s2;
			s1=new Shape();
			s2=new Rectangle();
	}

}
