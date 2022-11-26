package membership;
//DAO : Data Access Object 데이터베이스의 데이터에 접근하기 위한 객체 CRUD 작업관련한 기능

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import db.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}

//기존 멤버 session 저장
	public MemberDTO getMemberDTO(String uemail, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from TB_USER where email=? and pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uemail);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setUser_id(rs.getString("user_id"));
				dto.setEmail(rs.getString("email"));
				dto.setPass(rs.getString("pass"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setIntroduce(rs.getString("introduce"));
				dto.setProfile_image(rs.getString("profile_image"));
			}

		} catch (Exception e) {
			System.out.println("데이터 이동 x");
			e.printStackTrace();
		}
		return dto;
	}

//아이디 찾기
	public MemberDTO findIdDTO(String name, String tel ,String birth) {
		MemberDTO dto = new MemberDTO();
		String query = "select email from TB_USER WHERE user_name=? and tel=? and birth=?";
		
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, tel);
			psmt.setString(3, birth);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setEmail(rs.getString("email"));
			}		
		} catch (Exception e) {
			System.out.println("아이디 찾기 x");
			e.printStackTrace();
		}
		return dto;
	}
	
	//비밀번호 초기화
	public int resetPass(MemberDTO dto) {
		 int result = 0;
		 
		 try {
			 //쿼리문 템플릿 
			 String query = "UPDATE TB_USER SET pass= '1234' WHERE email=? and user_name=? and tel=?";
					       
			 //쿼리문 완성
			 psmt = con.prepareStatement(query);
			 psmt.setString(1,dto.getEmail());
			 psmt.setString(2,dto.getUser_name());
			 psmt.setString(3,dto.getTel());
			 
			 //쿼리문 실행
			 result = psmt.executeUpdate();
			 
		} catch (Exception e) {
			System.out.println("비밀번호 초기화 중 예외 발생");
			e.printStackTrace();
		}
		 	 
		 //결과값 반환
		 return result;
	 }
	
	//회원가입
	public int createMem(MemberDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO TB_USER  (user_id, email, pass, tel, birth, user_name, nickname, gender, profile_image)\r\n"
					+ "   VALUES  (seq_user_user_id.nextval, ?, ?, ?, ?, ?, ?, ?, 'profile_image.jpg')";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getUser_name());
			psmt.setString(6, dto.getNickname());
			psmt.setString(7, dto.getGender());

			result = psmt.executeUpdate(); // 동적쿼리 실행

		} catch (Exception e) {
			System.out.println("회원가입 중 오류 발생");
			e.printStackTrace();
		}
		return result; // 결과값 처리
	}
	
	//마이페이지 수정
	public int editPage(MemberDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE TB_USER SET introduce=? , tel=? , birth =?, user_name=? , nickname=? , profile_image=? WHERE user_id=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getIntroduce());
			psmt.setString(2, dto.getTel());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getUser_name());
			psmt.setString(5, dto.getNickname());
			psmt.setString(6, dto.getProfile_image());
			psmt.setString(7, dto.getUser_id());
			result = psmt.executeUpdate(); // 동적쿼리 실행
			
		} catch (Exception e) {
			System.out.println("마이페이지 수정 중 오류 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//비밀번호 수정
	public int editPass(MemberDTO dto) {
		 int result = 0;
		 
		 try {
			 //쿼리문 템플릿 
			 String query = "UPDATE TB_USER SET pass=? WHERE user_id=?";
					       
			 //쿼리문 완성
			 psmt = con.prepareStatement(query);
			 psmt.setString(1,dto.getPass());
			 psmt.setString(2,dto.getUser_id());
			 
			 result = psmt.executeUpdate();
			 
		} catch (Exception e) {
			System.out.println("비밀번호 수정 중 예외 발생");
			e.printStackTrace();
		}
		 	 
		 //결과값 반환
		 return result;
	 }
	//회원 탈퇴
	public int deleteMem(MemberDTO dto) {
		 int result = 0;
		 
		 try {
			 //쿼리문 템플릿 
			 String query = "DELETE FROM TB_USER WHERE user_id=?";
					       
			 //쿼리문 완성
			 psmt = con.prepareStatement(query);
			 psmt.setString(1,dto.getUser_id());
			 
			 result = psmt.executeUpdate();
			 
		} catch (Exception e) {
			System.out.println("회원 탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		 //결과값 반환
		 return result;
	 }
	
	//검색조건에 맞는 유저 목록 반환
	 public List<MemberDTO> selectList(Map<String,Object> map){
		    List<MemberDTO> bbs = new ArrayList<MemberDTO>(); 
		    String query;
		    if(map.get("searchWord") ==null) {
		    	query = "SELECT user_id, profile_image, nickname, user_name FROM TB_USER ";
		    }else {
		    	query = "SELECT user_id, profile_image, nickname, user_name FROM TB_USER ";
		    	query += " WHERE nickname LIKE '%" + map.get("searchWord") + "%' ";
		    }
		    query += "ORDER BY nickname ASC ";
		    
		    try {
		    	stmt = con.createStatement();
		    	rs = stmt.executeQuery(query);
		    	
		    	while(rs.next()) {
		    		MemberDTO dto = new MemberDTO();
		    		
		    		dto.setUser_id(rs.getString("user_id"));
		    		dto.setProfile_image(rs.getString("profile_image"));  //일련번호
		    		dto.setNickname(rs.getString("nickname"));
		    		dto.setUser_name(rs.getString("user_name"));
		    		bbs.add(dto); // 결과 목록에 저장 
		    	}
				
			} catch (Exception e) {
				System.out.println("닉네임 조회 중 예외 발생");
				e.printStackTrace();
			}
		   return bbs; 
	   }
	
	//아이디 중복체크
	 public int checkId(MemberDTO dto) {
		 int result =0;
		 
		 try {
			String query = "select email from TB_USER WHERE email=?";
			 
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getEmail());
			 
			result=psmt.executeUpdate();
			
			if(result == 0) {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 체크 중 예외 발생");
		}
		 return result;
	 }
}