package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import board.dao.AnswerDao;
import board.dao.MemberDao;
import board.dto.AnswerDto;

@RestController
public class AnswerController {
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	AnswerDao answerDao;
	//��� insert
	@GetMapping("/board/ainsert")
	public void insertAnswer(
			@RequestParam String content,
			@RequestParam int idx,
			@RequestParam int num
			) {
		System.out.println(idx);
		System.out.println(content);
		System.out.println("num="+num);
	//dto�� ���
	AnswerDto dto=new AnswerDto();
	dto.setContent(content);
	dto.setIdx(idx);
	dto.setNum(num);
	
	answerDao.insertAnswer(dto);
	}
	//�����ü list
	@GetMapping("/board/alist")
	public List<AnswerDto> getAllAnswers(@RequestParam int idx)
	{
		List<AnswerDto> list=answerDao.getAllAnswer(idx);//list�� json���·� ��ȯ
		for(AnswerDto dto:list)
		{
			try {
				String name=memberDao.selectOneOfNum(dto.getNum()).getName();
				String photo=memberDao.selectOneOfNum(dto.getNum()).getPhoto();
				
				dto.setName(name);
				dto.setPhoto(photo);
			} catch (Exception e) {
				// TODO: handle exception
				//�ش� num �� ������� ���������̼��� �߻�
				dto.setName("Ż����ȸ��");
				dto.setPhoto("noimage.jpg");
			}
		}
		return list;
	}
	@GetMapping("/board/adelete")
	public void deleteAnswer(@RequestParam int seq)
	{
		answerDao.deleteAnswer(seq);
	}
}
