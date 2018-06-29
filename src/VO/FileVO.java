package VO;

public class FileVO {
    private int fileId;
    private String fileName;
    private String fencName;
    private String filePath;
    private PostVO postVO;
    private AreaVO areaVO;
  
	public AreaVO getAreaVO() {
		return areaVO;
	}
	public void setAreaVO(AreaVO areaVO) {
		this.areaVO = areaVO;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFencName() {
		return fencName;
	}
	public void setFencName(String fencName) {
		this.fencName = fencName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public PostVO getPostVO() {
		return postVO;
	}
	public void setPostVO(PostVO postVO) {
		this.postVO = postVO;
	}
	
    


}
