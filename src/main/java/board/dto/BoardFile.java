package board.dto;

public class BoardFile {

	private int fileno;
	private int boardNo;
	private String originName;
	private String storedName;
	
	public BoardFile() {	}

	public BoardFile(int fileno, int boardNo, String originName, String storedName) {
		super();
		this.fileno = fileno;
		this.boardNo = boardNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "BoardFile [fileno=" + fileno + ", boardNo=" + boardNo + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getFileno() {
		return fileno;
	}

	public void setFileno(int fileno) {
		this.fileno = fileno;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public boolean isEmpty() {
		return false;
	}
	
}
