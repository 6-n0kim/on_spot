package comment;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import db.DBConnPool;


public class commentDAO extends DBConnPool{
	public commentDAO() {
		super();
	}
	//댓글 작성
	public int insertCom(commentDTO dto) {
		int result = 0;
		
		try {
		   String query ="INSERT INTO TB_comment(comment_id , c_content , user_id, post_id ) VALUES(seq_com_comment_id.nextval, ?, ?, ?)";
			
		   psmt = con.prepareStatement(query);
		   psmt.setString(1,dto.getC_content());
		   psmt.setString(2,dto.getUser_id());
		   psmt.setString(3, dto.getPost_id());
		   
		   result = psmt.executeUpdate();
		   
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("댓글 작성 중 예외 발생");
		}
		
		return result;
	}
	
	//댓글 리스트 생성
	public List<commentDTO> selectList(Map<String, Object> map) {
		List<commentDTO> bbs = new ArrayList<commentDTO>();
		//comment테이블에서 post_id 값을 가진 *을 list에 add 후 return
		String query = "SELECT C.*, U.profile_image, U.nickname "
					 + "FROM TB_USER U INNER JOIN tb_comment C "
					 + "ON U.user_id =C.user_id WHERE C.post_id =" + map.get("post_id")
					 + "ORDER BY comment_id ASC ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				commentDTO dto = new commentDTO();
				
				dto.setComment_id(rs.getString("comment_id"));
				dto.setC_content(rs.getString("c_content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPost_id(rs.getString("post_id"));
				dto.setProfile_image(rs.getString("profile_image"));
				dto.setNickname(rs.getString("nickname"));
				bbs.add(dto); // 결과 목록에 저장
			}
			System.out.println("댓글넣기 성공");
		} catch (Exception e) {
			System.out.println("리스트에 댓글 넣기 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;
	}
	
}
