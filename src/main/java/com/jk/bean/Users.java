package com.jk.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="users")
public class Users implements Serializable{
	private static final long serialVersionUID = -8020461185915192310L;
	@Id
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	@Column(name = "uname")
	private String uname;
	@Column(name = "uage")
	private Integer uage;
	@Column(name = "ubirthday")
	private String ubirthday;
	@Column(name = "uaddress")
	private String uaddress;
	@Column(name = "usex")
	private Integer usex;
	@Column(name = "uimg")
	private String uimg;
	@Column(name = "uhobby")
	private String uhobby;
	public Users() {
		super();
	}
	public Users(Integer id, String uname, Integer uage, String ubirthday, String uaddress, Integer usex, String uimg,
			String uhobby) {
		super();
		this.id = id;
		this.uname = uname;
		this.uage = uage;
		this.ubirthday = ubirthday;
		this.uaddress = uaddress;
		this.usex = usex;
		this.uimg = uimg;
		this.uhobby = uhobby;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getUage() {
		return uage;
	}
	public void setUage(Integer uage) {
		this.uage = uage;
	}
	public String getUbirthday() {
		return ubirthday;
	}
	public void setUbirthday(String ubirthday) {
		this.ubirthday = ubirthday;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public Integer getUsex() {
		return usex;
	}
	public void setUsex(Integer usex) {
		this.usex = usex;
	}
	public String getUimg() {
		return uimg;
	}
	public void setUimg(String uimg) {
		this.uimg = uimg;
	}
	public String getUhobby() {
		return uhobby;
	}
	public void setUhobby(String uhobby) {
		this.uhobby = uhobby;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", uname=" + uname + ", uage=" + uage + ", ubirthday=" + ubirthday + ", uaddress="
				+ uaddress + ", usex=" + usex + ", uimg=" + uimg + ", uhobby=" + uhobby + "]";
	}
	
	
	

	
}
