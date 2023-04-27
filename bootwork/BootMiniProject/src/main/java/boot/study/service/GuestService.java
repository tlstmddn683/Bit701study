package boot.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.study.dto.GuestDto;
import boot.study.dto.GuestPhotoDto;
import boot.study.mapper.GuestMapper;

@Service
public class GuestService implements GuestServiceinter {
	@Autowired
	GuestMapper guestMapper;
	
	@Override
	public void insertGuest(GuestDto dto) {
		// TODO Auto-generated method stub
		guestMapper.insertGuest(dto);
	}

	@Override
	public void insertPhoto(GuestPhotoDto dto) {
		// TODO Auto-generated method stub
		guestMapper.insertPhoto(dto);
	}

	@Override
	public List<GuestDto> getAllGuest() {
		// TODO Auto-generated method stub
		return guestMapper.getAllGuest();
	}

	@Override
	public List<GuestPhotoDto> getPhotos(int guest_idx) {
		// TODO Auto-generated method stub
		return guestMapper.getPhotos(guest_idx);
	}
	
}
