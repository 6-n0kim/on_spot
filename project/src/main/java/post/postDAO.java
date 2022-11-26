package post;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import db.DBConnPool;

public class postDAO extends DBConnPool {
	public postDAO() {
		super();
	}

	// post 테이블에 새글 저장 기능
	public int insertWrite(postDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO post(post_id , content , location , likecount, user_id , post_file) "
					+ "VALUES(" + "seq_post_post_id.NEXTVAL, ?, ?, 0, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getLocation());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getPost_file());

			result = psmt.executeUpdate(); // 동적쿼리 실행

		} catch (Exception e) {
			System.out.println("새글 저장 중 오류 발생");
			e.printStackTrace();
		}
		return result; // 결과값 처리
	}

	// 검색조건에 맞는 게시물 목록을 반환하는 selectList(Map<String,Object> map)
	public List<postDTO> selectList(Map<String, Object> map) {
		List<postDTO> bbs = new ArrayList<postDTO>();
		String query = "SELECT * FROM post ";
		if (map.get("searchWord") != null) {
			query += " WHERE location LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY postdate ASC ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				postDTO dto = new postDTO();

				dto.setPost_id(rs.getString("post_id")); 
				dto.setContent(rs.getString("content")); 
				dto.setLocation(rs.getString("location"));
				dto.setLikecount(rs.getString("likecount"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setPost_file(rs.getString("post_file"));
				bbs.add(dto); // 결과 목록에 저장
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;
	}
	//게시물 뷰
	 public postDTO postView(String post_id) {
		  postDTO dto = new postDTO();
		  
		  //쿼리문 작성 
		  String query = "SELECT P.*, U.nickname , U.profile_image "
				         + " FROM TB_USER U INNER JOIN post P "
				         + " ON U.user_id=P.user_id "
				         + " WHERE post_id=?";
		  
		  try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, post_id);
			rs = psmt.executeQuery();
			
			//결과처리
			if(rs.next()) {
				dto.setPost_id(rs.getString("post_id")); 
				dto.setContent(rs.getString("content")); 
				dto.setLocation(rs.getString("location"));
				dto.setLikecount(rs.getString("likecount"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setPost_file(rs.getString("post_file"));
				dto.setNickname(rs.getString("nickname"));
				dto.setProfile_image(rs.getString("profile_image"));
			}
					
		} catch (Exception e) {
			System.out.println("게시물 보기 중 예외 발생");
			e.printStackTrace();
		}
		 
		 return dto;
	 }
	
	 public int deletePost(postDTO dto) {
		 int result = 0;
		 
		 try {
			 //쿼리문 템플릿 
			 String query = "DELETE FROM post WHERE post_id=?";
					       
			 //쿼리문 완성
			 psmt = con.prepareStatement(query);
			 psmt.setString(1,dto.getPost_id());
			 
			 result = psmt.executeUpdate();
			 
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		 //결과값 반환
		 return result;
	 }
	 
	 public int editPost(postDTO dto) {
		 int result =0;
		
		 try {
			String query = "UPDATE post SET location = ? , content= ? WHERE post_id = ?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1,dto.getLocation());
			psmt.setString(2,dto.getContent());
			psmt.setString(3, dto.getPost_id());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 오류 발생");
			e.printStackTrace();
		}
				 
		return result;
	 }
	 
}