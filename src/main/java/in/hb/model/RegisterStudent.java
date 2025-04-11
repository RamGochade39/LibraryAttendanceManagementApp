package in.hb.model;

import java.io.Serializable;

import javax.persistence.Entity;

import javax.persistence.Id;

@Entity
public class RegisterStudent implements Serializable {

	@Id
	private Long stdId = null;
	private String stdName = null;
	private String course = null;
	private Long mobileNumber = null;

	public Long getStdId() {
		return stdId;
	}

	public void setStdId(Long stdId) {
		this.stdId = stdId;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public Long getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(Long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Override
	public String toString() {
		return "RegisterStudent [stdId=" + stdId + ", stdName=" + stdName + ", course=" + course + ", mobileNumber="
				+ mobileNumber + "]";
	}

}
