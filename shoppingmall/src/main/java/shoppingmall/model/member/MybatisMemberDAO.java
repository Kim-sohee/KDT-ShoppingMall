package shoppingmall.model.member;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.exception.MemberUpdateException;

@Slf4j
@Repository
public class MybatisMemberDAO implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Member selectById(String id) throws MemberNotFoundException {
		Member member = sqlSessionTemplate.selectOne("Member.selectById", id);
		log.debug("id로 조회한 회원은 " + member);
		
		if (member == null) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
		return member;
	}

	@Override
	public void insert(Member member) throws MemberRegistException {
		int result = sqlSessionTemplate.insert("Member.insert", member);
		
		if (result < 1) {
			throw new MemberRegistException("회원 등록에 실패하였습니다.");
		}
	}

	@Override
	public Member selectByEmail(String email) {
		Member member = sqlSessionTemplate.selectOne("Member.selectByEmail", email);
		return member;
	}

	@Override
	public Member login(Member member) throws MemberNotFoundException {
		Member loginMember = sqlSessionTemplate.selectOne("Member.login", member);
		
		if (loginMember == null) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
		return loginMember;
	}

	@Override
	public Member snsLogin(Member member) {
		Member loginMember = sqlSessionTemplate.selectOne("Member.snsLogin", member);
		return loginMember;
	}

	@Override
	public Member find(String name, String phone) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_name", name);
		paramMap.put("phone", phone);
		Member member = sqlSessionTemplate.selectOne("Member.selectByNameAndPhone", paramMap);
		
		if (member == null) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
		return member;
	}

	@Override
	public void update(Member member) throws MemberUpdateException {
		int result = sqlSessionTemplate.update("Member.update", member);
		
		if (result < 1) {
			throw new MemberUpdateException("회원 정보 수정에 실패하였습니다.");
		}
	}
	
}
