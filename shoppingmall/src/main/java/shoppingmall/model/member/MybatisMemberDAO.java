package shoppingmall.model.member;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
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
		Member member = sqlSessionTemplate.selectOne("Member.selectReveiwAndQna", paramMap);
		if(member == null) {
			throw new MemberNotFoundException("해당 회원 정보를 불러올 수 없습니다.");
		}
		return member;
	}
	
	@Override
	public List<Member> selectAll() {
		return sqlSessionTemplate.selectList("Member.selectAll");
	}
	
	@Override
	public List<Member> selectByPage(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Member.selectByPage", map);
	}
	
	@Override
	public Member select(int member_id) {
		return sqlSessionTemplate.selectOne("Member.select", member_id);
	}
	
	@Override
	public Member selectWithDelivery(int member_id) {
		return sqlSessionTemplate.selectOne("Member.selectWithDelivery",member_id);
	}
	
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
	public Member findIdAndPwd(String name, String phone) {
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
	
	@Override
	public void delete(int member_id) throws MemberDeleteException {
		int result = sqlSessionTemplate.delete("Member.delete", member_id);
		if (result < 1) {
			throw new MemberDeleteException("회원 삭제에 실패하였습니다.");
		}
	}
	
	@Override
	public int totalRecord() {
		return sqlSessionTemplate.selectOne("Member.totalRecord");
	}
}
