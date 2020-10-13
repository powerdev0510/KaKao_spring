package com.ycar.server.carpool.domain;

public class DriverReservation {

	private int dr_idx; // 운전자 예약번호
	private int d_idx; // 회원번호
	private String d_date; // 날짜
	private String d_startTime; // 출발시간
	private String d_endTime; // 도착시간
	private String d_commute; // 출퇴근
	private String d_startPoint; // 출발지
	private String d_endPoint; // 도착지
	private int d_fee; // 요금
	private int d_distance; // 총거리
	private String d_startlon; // 시작위도
	private String d_startlat; // 경도
	private String d_endlon; // 도착위도
	private String d_endlat; // 경도

	private String nickname; // 탑승자 닉네임

	private int r_idx; // 예약번호
	private String r_confirm; // 수락여부

	public DriverReservation() {
	}

	public DriverReservation(int dr_idx, int d_idx, String d_date, String d_startTime, String d_endTime,
			String d_commute, String d_startPoint, String d_endPoint, int d_fee, int d_distance, String d_startlon,
			String d_startlat, String d_endlon, String d_endlat, String nickname, String r_confirm,
			int r_idx) {
		this.dr_idx = dr_idx;
		this.d_idx = d_idx;
		this.d_date = d_date;
		this.d_startTime = d_startTime;
		this.d_endTime = d_endTime;
		this.d_commute = d_commute;
		this.d_startPoint = d_startPoint;
		this.d_endPoint = d_endPoint;
		this.d_fee = d_fee;
		this.d_distance = d_distance;
		this.d_startlon = d_startlon;
		this.d_startlat = d_startlat;
		this.d_endlon = d_endlon;
		this.d_endlat = d_endlat;
		this.nickname = nickname;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public String getR_confirm() {
		return r_confirm;
	}

	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getD_startlon() {
		return d_startlon;
	}

	public void setD_startlon(String d_startlon) {
		this.d_startlon = d_startlon;
	}

	public String getD_startlat() {
		return d_startlat;
	}

	public void setD_startlat(String d_startlat) {
		this.d_startlat = d_startlat;
	}

	public String getD_endlon() {
		return d_endlon;
	}

	public void setD_endlon(String d_endlon) {
		this.d_endlon = d_endlon;
	}

	public String getD_endlat() {
		return d_endlat;
	}

	public void setD_endlat(String d_endlat) {
		this.d_endlat = d_endlat;
	}

	public int getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public String getD_date() {
		return d_date;
	}

	public void setD_date(String d_date) {
		this.d_date = d_date;
	}

	public String getD_startTime() {
		return d_startTime;
	}

	public void setD_startTime(String d_startTime) {
		this.d_startTime = d_startTime;
	}

	public String getD_endTime() {
		return d_endTime;
	}

	public void setD_endTime(String d_endTime) {
		this.d_endTime = d_endTime;
	}

	public String getD_commute() {
		return d_commute;
	}

	public void setD_commute(String d_commute) {
		this.d_commute = d_commute;
	}

	public String getD_startPoint() {
		return d_startPoint;
	}

	public void setD_startPoint(String d_startPoint) {
		this.d_startPoint = d_startPoint;
	}

	public String getD_endPoint() {
		return d_endPoint;
	}

	public void setD_endPoint(String d_endPoint) {
		this.d_endPoint = d_endPoint;
	}

	public int getD_fee() {
		return d_fee;
	}

	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}

	public int getD_distance() {
		return d_distance;
	}

	public void setD_distance(int d_distance) {
		this.d_distance = d_distance;
	}

	@Override
	public String toString() {
		return "DriverReservation [카풀 idx=" + dr_idx + ", 운전자 idx=" + d_idx + ", d_date=" + d_date + ", d_startTime="
				+ d_startTime + ", d_endTime=" + d_endTime + ", d_commute=" + d_commute + ", d_startPoint="
				+ d_startPoint + ", d_endPoint=" + d_endPoint + ", d_fee=" + d_fee + ", d_distance=" + d_distance
				+ ", d_startlon=" + d_startlon + ", d_startlat=" + d_startlat + ", d_endlon=" + d_endlon + ", d_endlat="
				+ d_endlat + ", 탑승자 닉네임 =" + nickname + ", 예약 idx=" + r_idx + " , 예약 B,Y,N 여부="
				+ r_confirm + "]";
	}
	
	

}
