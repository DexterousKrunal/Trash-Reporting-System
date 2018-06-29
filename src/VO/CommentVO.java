package VO;

public class CommentVO {
	private int commentId;
	private PostVO postVO;
	public PostVO getPostVO() {
		return postVO;
	}
	public void setPostVO(PostVO postVO) {
		this.postVO = postVO;
	}
	private String commentDesc;
	private LoginVO loginVO;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	
	public String getCommentDesc() {
		return commentDesc;
	}
	public void setCommentDesc(String commentDesc) {
		this.commentDesc = commentDesc;
	}
	public LoginVO getLoginVO() {
		return loginVO;
	}
	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}
	

}
