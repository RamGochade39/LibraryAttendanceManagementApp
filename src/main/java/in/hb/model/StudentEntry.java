package in.hb.model;

import java.sql.Date;
import java.sql.Time;
import javax.persistence.*;

@Entity
public class StudentEntry {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Long stdId = null;
	private Date date;
	private String stdName = null;
	private String stdCourse = null;

	@Column(name = "entryTime", columnDefinition = "TIME")
	private Time entryTime;

	@Column(name = "exitTime", columnDefinition = "TIME")
	private Time exitTime;
	@Version
	private Integer count = null;

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

	public String getStdCourse() {
		return stdCourse;
	}

	public void setStdCourse(String stdCourse) {
		this.stdCourse = stdCourse;
	}

	// Getters and Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Time getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Time entryTime) {
		this.entryTime = entryTime;
	}

	public Time getExitTime() {
		return exitTime;
	}

	public void setExitTime(Time exitTime) {
		this.exitTime = exitTime;
	}

	@Override
	public String toString() {
		return "StudentEntry [id=" + id + ", stdId=" + stdId + ", date=" + date + ", stdName=" + stdName
				+ ", stdCourse=" + stdCourse + ", count=" + count + ", entryTime=" + entryTime + ", exitTime="
				+ exitTime + "]";
	}

}
