package boot.study.controller;

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

	List<MultipartFile> upload;
	
	@GetMapping("/list")
	public String list()
	{
		return "/sub/guest/guestlist";
	}
	
	@PostMapping("/upload")
	@ResponseBody
	public void upload(List<MultipartFile> upload)
	{
		System.out.println("size:"+upload.size());
		this.upload=upload;
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void insertGuest(GuestDto dto)
	{
		//방명록 데이터부터 db에 저장합니다
		guestService.insertGuest(dto);
		System.out.println("guest_idx:"+dto.getGuest_idx());
		
		System.out.println("filename:"+upload.get(0).getOriginalFilename());
		//업로드한 사진이 있는 경우
		if(!upload.get(0).getOriginalFilename().equals(""))
		{
			for(MultipartFile file:upload)
			{
				//스토리지에 업로드합니다
				String photoname=storageService.uploadFile(bucketName, "guest" , file);
				//업로드한 파일명을 db에 저장합니다
				GuestPhotoDto pdto=new GuestPhotoDto();
				pdto.setGuest_idx(dto.getGuest_idx());
				pdto.setPhotoname(photoname);
				
				guestService.insertPhoto(pdto);
			}
		}
	}
}
