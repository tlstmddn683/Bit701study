package study.day0308;
interface Emp{
	String getName();
	
	static boolean isEmpty(String str) {
		if(str==null||str.trim().length()==0) {
			return true;
			
		}else {
			return false;
		}
	}
}
class Employee implements Emp{
	private String name;
	
	public Employee(String name) {
		if(Emp.isEmpty(name)==true)
		throw new RuntimeException("이름을 반드시 입력할것");
		this.name=name;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return this.name;
		
	}
	
}
public class Munje2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Emp employee1=new Employee("강호동");
//			Emp employee2=new Employee("");
	}

}
