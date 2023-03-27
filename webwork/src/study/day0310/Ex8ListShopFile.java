package study.day0310;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class Ex8ListShopFile {
	static final String FILENAME = "d:/Bit701Naver/shop.txt";

	List<ShopDTO> list = new Vector<>();

	Scanner sc = new Scanner(System.in);

	public Ex8ListShopFile() {
		shopFileRead();
	}

	public void shopFileRead() {
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
				ShopDTO dto = new ShopDTO();
				dto.setSangpum(data[0]);
				dto.setSu(Integer.parseInt(data[1].trim()));
				dto.setDan(Integer.parseInt(data[2].trim()));
				list.add(dto);
			}

		} catch (FileNotFoundException e) {
			// TODO: handle exception
//			e.printStackTrace();
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

	// 종료시 list의 데이터를 파일에 저장
	public void shopFileSave() {
		// list의 내용을 파일에 저장하기
		FileWriter fw = null;
		try {
			fw = new FileWriter(FILENAME);

			for (ShopDTO dto : list) {
				String s = dto.getSangpum() + "," + dto.getSu() + "," + dto.getDan() + "\n";
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

	// 데이터 추가하는 메소드
	public void dataAdd() {
		System.out.println("추가할 상품은?");
		String sang = sc.nextLine();
		int su = 0, dan = 0;
		System.out.println("수량은?");
		try {
			su = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("수량에 문자가 포함되어 있기 때문에 1개로 저장함!");
			su = 1;
		}
		System.out.println("단가는?");
		try {
			dan = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("단가에 문자가 포함되어 있기 때문에 1000원으로 저장함!");
			dan = 1000;
		}
		// dto에 값 넣기
		ShopDTO dto = new ShopDTO(sang, su, dan);

		// list에 dto 추가
		list.add(dto);
		System.out.println(list.size() + "번째" + sang + "상품추가!!");

	}

	// 전체 출력 메소드
	public void shopList() {
		System.out.println("총" + list.size() + "개의 상품이 있습니다");
		System.out.println();
		System.out.println("번호\t상품\t수량\t단가\t총금액");
		System.out.println("=".repeat(40));
		int n = 1;
		for (ShopDTO dto : list) {
			System.out.println(n++ + "\t" + dto.getSangpum() + "\t" + dto.getSu() + "\t" + dto.getDan() + "\t"
					+ dto.getSu() * dto.getDan());
		}
	}

	// 상품 검색메소드
	public void shopSearch() {
		System.out.println("검색할 상품을 입력해주세요");
		String sang = sc.nextLine();

		boolean find = false;
		for (int i = 0; i < list.size(); i++) {
			// i번지의 dto얻기
			ShopDTO dto = list.get(i);
//			if(dto.getSangpum().startsWith(sang));
			//입력한 상품명으로 시작하는 상품 모두출력
			
			//상품명을 포함한 경우 모두 출력하기
			if(dto.getSangpum().contains(sang))
			{
				find=true;
				System.out.println(i+":"+dto.getSangpum()+" "+dto.getDan()+"원");
				
			}
		}
		if(!find)
		{
			System.out.println(sang+"관련상품이 없습니다!");
		}
	}

	

	// 상품 삭제메소드
	public void shopDelete() {
		System.out.println("삭제할 상품명은?");
		String sang = sc.nextLine();

		boolean find = false;
		for (int i = list.size() - 1; i >= 0; i--) {
			// i번지의 dto얻기
			ShopDTO dto = list.get(i);
			if (sang.equals(dto.getSangpum())) {
				find = true;
				list.remove(i);
			}
		}
		if (!find) {
			System.out.println(sang + "상품은 목록에 없습니다!");
		} else
			System.out.println(sang + "상품 삭제 완료!!");
	}

	// 메뉴
	public int getMenu() {

		int menu;
		System.out.println("****메뉴 선택****");
		System.out.println("1.상품 추가 2.상품 전체 출력 3.상품검색 4.상품삭제 5.종료");
		try {
			menu = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			menu = 2;// 문자로 잘못 입력시 무조건 전체 출력하기
			// TODO: handle exception
		}
		return menu;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex8ListShopFile ex = new Ex8ListShopFile();
		while (true) {
			switch (ex.getMenu()) {
			case 1:
				ex.dataAdd();
				break;
			case 2:
				ex.shopList();
				break;
			case 3:
				ex.shopSearch();
				break;
			case 4:
				ex.shopDelete();
				break;

			default:
				ex.shopFileSave();
				System.out.println("*****프로그램 종료******");
				System.exit(0);
			}
			System.out.println("=".repeat(40));
		}
	}

}
