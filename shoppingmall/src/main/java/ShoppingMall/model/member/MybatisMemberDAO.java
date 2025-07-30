package shoppingmall.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Member;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Member selectById(String id) {
		return sqlSessionTemplate.selectOne("Member.selectById", id);
	}
	
	@Override
	public void insert(Member member) throws MemberRegistException {
		int result = sqlSessionTemplate.insert("Member.insert", member);
		if(result<1) {
			throw new MemberRegistException("회원 등록에 실패하였습니다.");
		}
	}
	
	@Override
	public Member selectByEmail(String email) throws MemberNotFoundException {
		Member member = sqlSessionTemplate.selectOne("Member.selectByEmail", email);
		if(member==null) {
			throw new MemberNotFoundException("입력하신 정보와 일치하는 회원이 없습니다."); 
		}
		return member;
	}
	
	@Override
	public Member login(Member member) {
		// TODO Auto-generated method stub
		return null;
	}
}
