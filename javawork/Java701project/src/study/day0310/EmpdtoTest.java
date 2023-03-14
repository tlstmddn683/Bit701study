package study.day0310;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class EmpdtoTest {
	static final String FILENAME = "d:/Bit701Naver/emp.txt";
	List<EmpDTO> list = new Vector<>();

	Scanner sc = new Scanner(System.in);

	public EmpdtoTest() {
		empFileRead();
	}

	public void empFileRead() {
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);

			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
				String[] data = line.split(",");
				// ","로 분리
				EmpDTO dto = new EmpDTO();
				dto.getName(data[0]);
				dto.getBuso(data[1]);
				dto.getAge(Integer.parseInt(data[2].trim()));
				dto.getHp(data[3]);
				list.add(dto);
			}
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
				if (fr != null)
					fr.close();

			} catch (IOException e) {
				// TODO: handle exception
			}
		}
		System.out.println("총" + list.size() + "개의 데이터를 가져왔습니다");
	}

	public void EmpAdd() {
		System.out.println("추가할 직원은?");
		String name = sc.nextLine();
		String buso = sc.nextLine();
		String Hp = sc.nextLine();
		int age = 0;
		System.out.println("나이는?");
		try {
			age = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("나이에 문자가 포함되어 있기 때문에 20으로 저장함!");
			age = 20;
		}

		// dto에 값 넣기
		EmpDTO dto = new EmpDTO(name, buso, Hp, age);

		// list에 dto 추가
		list.add(dto);
		System.out.println(list.size() + "번의" + name + "직원이 추가되었습니다!");

	}

	public void EmpList() {
		System.out.println("총" + list.size() + "명의 직원이 있습니다");
		System.out.println();
		System.out.println("번호\t이름\t부서\t나이\t전화번호");
		System.out.println("=".repeat(50));
		int n = 1;
		for (EmpDTO dto : list) {
			System.out.println(
					n++ + "\t" + dto.getName() + "\t" + dto.getBuso() + "\t" + dto.getAge() + "\t" + dto.getHp());
		}
	}

	public void EmpSearch() {

		System.out.println("검색할 이름을 입력해주세요");
		String name = sc.nextLine();

		boolean find = false;
		for (int i = 0; i < list.size(); i++) {
			// i번지의 dto얻기
			EmpDTO dto = list.get(i);
//				if(dto.getSangpum().startsWith(sang));
			// 입력한 상품명으로 시작하는 상품 모두출력

			// 상품명을 포함한 경우 모두 출력하기
			if (dto.getName().contains(name)) {
				find = true;
				System.out.println(i + ":" + dto.getName() + " " + dto.getBuso());

			}
		}
		if (!find) {
			System.out.println(name + " 라는 직원은 존재하지않습니다.");
		}
	}

	public void EmpDelete() {
		System.out.println("삭제할 성명은?");
		String name = sc.nextLine();

		boolean find = false;
		for (int i = list.size() - 1; i >= 0; i--) {
			// i번지의 dto얻기
			EmpDTO dto = list.get(i);
			if (name.equals(dto.getName())) {
				find = true;
				list.remove(i);
			}
		}
		if (!find) {
			System.out.println(name + "라는 직원은 목록에 없습니다!");
		} else
			System.out.println(name + "직원 정보 삭제 완료");
	}

	public void EmpFileSave() {
		FileWriter fw = null;
		try {
			fw = new FileWriter(FILENAME);

			for (EmpDTO dto : list) {
				String s = dto.getName() + "," + dto.getBuso() + "," + dto.getAge() + ","+dto.getHp()+"\n";
				fw.write(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	public void BusoSearch() {
		System.out.println("검색할  부서를 입력해주세요");
		String buso = sc.nextLine();

		boolean find = false;
		for (int i = 0; i < list.size(); i++) {
			// i번지의 dto얻기
			EmpDTO dto = list.get(i);
//				if(dto.getSangpum().startsWith(sang));
			// 입력한 상품명으로 시작하는 상품 모두출력

			// 상품명을 포함한 경우 모두 출력하기
			if (dto.getBuso().contains(buso)) {
				find = true;
				System.out.println(i + ":" + dto.getBuso() + " " + dto.getName());

			}
		}
		if (!find) {
			System.out.println(buso + " 라는 부서가 존재하지않습니다.");
		}
	}

	public int getMenu() {

		int menu;
		System.out.println("****메뉴****");
		System.out.println("1.사원추가 2.사원 정보 검색 3.사원 정보 삭제 4.부서명 검색 5.전체출력 6.종료");
		try {
			menu = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			menu = 5;// 문자로 잘못 입력시 무조건 전체 출력하기
			// TODO: handle exception
		}
		return menu;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EmpdtoTest emp = new EmpdtoTest();
		while (true) {
			switch (emp.getMenu()) {
			case 1:
				emp.EmpAdd();
				break;
			case 2:
				emp.EmpSearch();
				break;
			case 3:
				emp.EmpDelete();
				break;
			case 4:
				emp.BusoSearch();
				break;
			case 5:
				emp.EmpList();
			default:
				emp.EmpFileSave();
				System.out.println("*****프로그램 종료******");
				System.exit(0);
			}
			System.out.println("=".repeat(40));
		}
	}

}
