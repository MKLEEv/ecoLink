package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.MemberDTO;

@Repository
public class MyInfoDAO {
	@Autowired
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public MemberDTO getUser(String memId) {
		return session.selectOne("getUserlogin", memId);
	}
	
	public int userUpdate(MemberDTO dto) {
		return session.update("userUpdate",dto);
	}
	
	public int deleteUser(String memId) {
		return session.delete("UserDelete",memId);
	}
	
}
