package shoppingmall.model.member;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.exception.MemberDeleteException;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.exception.MemberUpdateException;

@Slf4j
@Repository
public class MybatisMemberDAO implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Member getChildList(int member_id, Timestamp startDate, Timestamp endDate) throws MemberNotFoundException {
		Map<String, Object> paramMap = new HashMap<>();
		log.debug("DAO로 넘어온 시작일자는 "+startDate);
		log.debug("DAO로 넘어온 종료일자는 "+endDate);
		
		paramMap.put("member_id", member_id);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		
		try {
			return sqlSessionTemplate.selectOne("Member.selectReveiwAndQna", paramMap);
		} catch (Exception e) {
			throw new MemberNotFoundException("해당 회원 정보를 불러올 수 없습니다.");
		}
	}
	
	@Override
	public Member selectById(String id) throws MemberNotFoundException {
		log.debug("id로 조회한 회원은 " + sqlSessionTemplate.selectOne("Member.selectById", id));
		try {
			return sqlSessionTemplate.selectOne("Member.selectById", id);
		} catch (Exception e) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
	}

	@Override
	public void insert(Member member) throws MemberRegistException {
		try {
			sqlSessionTemplate.insert("Member.insert", member);
		} catch (Exception e) {
			throw new MemberRegistException("회원 등록에 실패하였습니다.");
		}
	}
	
	@Override
	public Member selectByEmail(String email) throws MemberNotFoundException {
		try {
			return sqlSessionTemplate.selectOne("Member.selectByEmail", email);
		} catch (Exception e) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
		
	}

	@Override
	public Member login(Member member) throws MemberNotFoundException {
		try {
			return sqlSessionTemplate.selectOne("Member.login", member);
		} catch (Exception e) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
	}

	@Override
	public Member snsLogin(Member member) {
		try {
			return sqlSessionTemplate.selectOne("Member.snsLogin", member);
		} catch (Exception e) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
	}

	@Override
	public Member findIdAndPwd(String name, String phone) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_name", name);
		paramMap.put("phone", phone);
		
		try {
			return sqlSessionTemplate.selectOne("Member.selectByNameAndPhone", paramMap);
		} catch (Exception e) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다.");
		}
	}

	@Override
	public void update(Member member) throws MemberUpdateException {
		try {
			sqlSessionTemplate.update("Member.update", member);
		} catch (Exception e) {
			throw new MemberUpdateException("회원 정보 수정에 실패하였습니다.");
		}
	}
	
	@Override
	public void delete(int member_id) throws MemberDeleteException {
		try {
			sqlSessionTemplate.delete("Member.delete", member_id);
		} catch (Exception e) {
			throw new MemberDeleteException("회원 삭제에 실패하였습니다.");
		}
	}
	
}
