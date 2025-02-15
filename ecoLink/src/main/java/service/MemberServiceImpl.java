package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDAO;
import dto.EnterpriseDTO;
import dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
    
	@Autowired
	MemberDAO dao;
    
//	// 회원 정보 조회
//	@Override
//	public MemberDTO oneMember(String id) {
//		return dao.oneMember(id);
//	}
	
	//로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return dao.login(memberDTO);
	}
	
	// 회원가입
	public void addMember(MemberDTO member) {
//	    // memNick 카운트
//	    int count = dao.getMemberCountByType(member.getMemType());
//	    String memNick = member.getMemType() + (count + 1);
//	    member.setMemNick(memNick);
	    dao.addMember(member);
	}
	
	public void addEnterprise(String entCrn, String entPhone) {
		  dao.addEnterprise(entCrn, entPhone);
		}

    
    //id중복여부
    public int isMemberIdExist(String inputId) {
    	return dao.isMemberIdExist(inputId);
    }
    
    //email중복여부
    public int isMemberEmailExist(String inputEmail) {
    	return dao.isMemberEmailExist(inputEmail);
    }	
	 
    /*
    //id 중복여부
    @Override
    public boolean isMemberIdExist(String memberId) {
        return dao.isMemberIdExist(memberId);
    }

    //email 중복여부
    @Override
    public boolean isMemberEmailExist(String memberEmail) {
        return dao.isMemberEmailExist(memberEmail);
    }

 // 회원가입
    @Override
    public void saveMemberInfo(MemberDTO memberDto) {
        if (memberDto.getMemType().equals("buis")) {
            // 기업 정보 저장을 위해 saveEnterpriseData 함수 호출
            saveEnterpriseData(null);
        } else {
            // 개인 정보만 저장하는 경우
            dao.saveMemberInfo(memberDto, null);
        }
    }

    // 기업 정보 저장 함수
    private void saveEnterpriseData(EnterpriseDTO enterpriseDto) {
        dao.saveEnterpriseInfo(enterpriseDto);
    }


    ///nick 카운트
	@Override
	public int isNickExists(String memNick) {
	    return dao.isNickExists(memNick);
	}
	*/
}
