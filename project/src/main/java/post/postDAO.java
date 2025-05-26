package post;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import db.DBConnPool;

public class PostDAO extends DBConnPool {
	public PostDAO() {
		super();
	}

	/**
	 * 새로운 게시글을 저장합니다.
	 * @param dto 저장할 게시글 정보
	 * @return 저장 성공 여부 (1: 성공, 0: 실패)
	 */
	public int insertWrite(PostDTO dto) {
		int result = 0;
		String query = "INSERT INTO post(post_id, content, location, likecount, user_id, post_file) " +
					  "VALUES(seq_post_post_id.NEXTVAL, ?, ?, 0, ?, ?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getLocation());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getPost_file());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("게시글 저장 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 검색 조건에 맞는 게시물 목록을 반환합니다.
	 * @param map 검색 조건을 담은 Map
	 * @return 게시물 목록
	 */
	public List<PostDTO> selectList(Map<String, Object> map) {
		List<PostDTO> posts = new ArrayList<>();
		StringBuilder query = new StringBuilder("SELECT * FROM post ");
		
		if (map.get("searchWord") != null) {
			query.append("WHERE location LIKE '%").append(map.get("searchWord")).append("%' ");
		}
		query.append("ORDER BY postdate ASC");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setPost_id(rs.getString("post_id")); 
				dto.setContent(rs.getString("content")); 
				dto.setLocation(rs.getString("location"));
				dto.setLikecount(rs.getString("likecount"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setPost_file(rs.getString("post_file"));
				posts.add(dto);
			}
		} catch (Exception e) {
			System.err.println("게시물 조회 중 예외 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return posts;
	}

	/**
	 * 특정 게시물의 상세 정보를 조회합니다.
	 * @param post_id 게시물 ID
	 * @return 게시물 정보
	 */
	public PostDTO postView(String post_id) {
		PostDTO dto = new PostDTO();
		String query = "SELECT P.*, U.nickname, U.profile_image " +
					  "FROM TB_USER U INNER JOIN post P " +
					  "ON U.user_id = P.user_id " +
					  "WHERE post_id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, post_id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
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
			System.err.println("게시물 조회 중 예외 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}

	/**
	 * 게시물을 삭제합니다.
	 * @param dto 삭제할 게시물 정보
	 * @return 삭제 성공 여부 (1: 성공, 0: 실패)
	 */
	public int deletePost(PostDTO dto) {
		int result = 0;
		String query = "DELETE FROM post WHERE post_id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPost_id());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("게시물 삭제 중 예외 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 게시물을 수정합니다.
	 * @param dto 수정할 게시물 정보
	 * @return 수정 성공 여부 (1: 성공, 0: 실패)
	 */
	public int editPost(PostDTO dto) {
		int result = 0;
		String query = "UPDATE post SET location = ?, content = ? WHERE post_id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getLocation());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getPost_id());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("게시물 수정 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
}