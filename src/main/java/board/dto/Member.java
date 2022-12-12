package board.dto;

public class Member {

	private String id;
	private String pw;
	private String nick; //기존
	
	private String name; //추가
	private String gender;
	private String phone;
	private String addr;
	private String email;
	
	public Member() {	}

	public Member(String id, String pw, String nick, String name, String gender, String phone, String addr,
			String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", nick=" + nick + ", name=" + name + ", gender=" + gender
				+ ", phone=" + phone + ", addr=" + addr + ", email=" + email + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
