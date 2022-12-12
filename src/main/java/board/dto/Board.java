package board.dto;

import java.util.Date;

public class Board {
	
	private int boardNo;
	private String title;
	private String content;
	private String writerId;
	private String writerNick;
	private int hit;
	private Date writeDate;
	
	public Board() {	}

	public Board(int boardNo, String title, String content, String writerId, String writerNick, int hit,
			Date writeDate) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.writerNick = writerNick;
		this.hit = hit;
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writerId=" + writerId
				+ ", writerNick=" + writerNick + ", hit=" + hit + ", writeDate=" + writeDate + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterNick() {
		return writerNick;
	}

	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
	

}
