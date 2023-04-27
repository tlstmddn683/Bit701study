package boot.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.study.dto.GuestDto;
import boot.study.dto.GuestPhotoDto;
import boot.study.service.GuestService;
import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/guest")
public class GuestController {
	@Autowired
	GuestService guestService;
	@Autowired
	private NcpObjectStorageService storageService;
	// 버켓이름 지정
	private String bucketName = "bit701-bucket-115";// 각자 자기의 버켓이름

	List<String> photoNames = new ArrayList<>();

	@GetMapping("/list")
	public String list() 
	{
		return "/sub/guest/guestlist";
	}

	
	
//	@PostMapping("/upload")
//	@ResponseBody
//	public void upload(List<MultipartFile> upload) {
//		System.out.println("size:" + upload.size());
//		System.out.println("filename 0:" + upload.get(0).getOriginalFilename());
//
//		photoNames.clear();
//
//		for (MultipartFile file : upload) {
//			// 스토리지에 업로드
//			String photoname = storageService.uploadFile(bucketName, "guest", file);
//			System.out.println("name:" + photoname);
//			// 업로드한 파일명을 db 에 저장
//			photoNames.add(photoname);
//
//		}
//	}

//	@PostMapping("/insert")
//	@ResponseBody
//	public void insertGuest(GuestDto dto) {
//		// 방명록 데이타부터 db 에 저장
//		guestService.insertGuest(dto);
//		System.out.println("guest_idx:" + dto.getGuest_idx());
//
//		for (String photoname : photoNames) {
//			// 업로드한 파일명을 db 에 저장
//			GuestPhotoDto pdto = new GuestPhotoDto();
//			pdto.setGuest_idx(dto.getGuest_idx());
//			pdto.setPhotoname(photoname);
//			guestService.insertPhoto(pdto);
//		}
//	}
	
	
	
	
	//insert할때 파일도 같이 업로드
	@PostMapping("/insert")
	@ResponseBody
	public void insertGuest(GuestDto dto,List<MultipartFile> upload) {
		
		System.out.println("content:"+dto.getContent());
		
		// 방명록 데이타부터 db 에 저장
		guestService.insertGuest(dto);
		System.out.println("guest_idx:" + dto.getGuest_idx());
if(upload!=null) {
		System.out.println("size:"+upload.size());
		System.out.println("filename 0:" + upload.get(0).getOriginalFilename());
		for (MultipartFile file:upload) {
			//스토리지에 업로드
			String photoname=storageService.uploadFile(bucketName, "guest", file);
			// 업로드한 파일명을 db 에 저장
			GuestPhotoDto pdto = new GuestPhotoDto();
			pdto.setGuest_idx(dto.getGuest_idx());
			pdto.setPhotoname(photoname);
			guestService.insertPhoto(pdto);
			}
		}
	}
}
