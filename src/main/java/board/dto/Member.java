package board.dto;

public class Member {

	private String id;
	private String pw;
	private String nick; //기존
	
	private String name; //추가
	private String birth;
	private String gender;
	private String email;
	private String phone;
	
	public Member() {	}

	public Member(String id, String pw, String nick, String name, String birth, String gender, String email,
			String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", nick=" + nick + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + "]";
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
