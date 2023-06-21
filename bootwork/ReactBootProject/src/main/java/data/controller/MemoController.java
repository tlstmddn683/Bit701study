package data.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import data.dto.MemoDto;
import data.service.MemoService;
import lombok.AllArgsConstructor;

@RestController
@CrossOrigin
@AllArgsConstructor
@RequestMapping("/memo")
public class MemoController {

	MemoService memoService;
	
	@GetMapping("/trans")
	public String transEng(@RequestParam(defaultValue = "")  String korMsg)
	{
		System.out.println("trans>>"+korMsg);
		
		String clientId = "1ekcyftcak";
		String clientSecret = "bd9qk2UFYJsG2qU64NXHWrn8P8mTQLIj9ZLOVsBy";//애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(korMsg, "UTF-8");
			String apiURL = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			// post request
			String postParams = "source=ko&target=en&text=" + text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 오류 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			return response.toString();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	@PostMapping("/insert")
	public void insertMemo(@RequestBody MemoDto dto)
	{
		System.out.println("insert>>"+dto);
		memoService.insertMemo(dto);
	}
	
	@GetMapping("/list")
	public List<MemoDto> getList(@RequestParam(defaultValue = "") String searchQuery)
	{
		if (searchQuery.isEmpty()) {
            return memoService.getAllMemos();
        } else {
            return memoService.searchMemos(searchQuery);
        }
    }
	
	@PostMapping("/update")
	public void updateMemo(@RequestBody MemoDto dto)
	{
		System.out.println("update>>"+dto);
		memoService.updateMemo(dto);
	}
	
	@DeleteMapping("/delete")
	public void deleteMemo(int num)
	{
		System.out.println("delete>>"+num);
		memoService.deleteMemo(num);
	}
}




























