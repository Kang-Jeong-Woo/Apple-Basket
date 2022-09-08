package com.foodshring.VO;

// 안전주소
public class t_safeVO {
	
	    private int safeSeq;                               /*                         순번                            */
	    private String safeAddr;                          /*                          주소                            */
	    private String safeCenter;                       /*                          중심지                            */
	    private String safeGungu;                       /*                            군구                            */
	    private String latitude;                       /*                             위도                            */
	    private String longitude;                      /*                             경도                            */
	    private String dongNm;                         /*                             동이름                           */
	    
	    private String userNm;                         /*                             판매자이름                        */
	    private String itemDeadline;                   /*                             판매종료일                        */
	    private String itemName;                       /*                             아이템이름                        */
	    private int itemSeq;                          /*                              아이템번호                        */
	    private String regDate;                       /*                              게시물작성일                       */
	    
	    
	    
	    
	    public t_safeVO() {
			super();
			// TODO Auto-generated constructor stub
		}
	    
	    
	    public t_safeVO(int safeSeq, String safeAddr, String safeCenter, String safeGungu, String latitude,
				String longitude, String dongNm) {
			super();
			this.safeSeq = safeSeq;
			this.safeAddr = safeAddr;
			this.safeCenter = safeCenter;
			this.safeGungu = safeGungu;
			this.latitude = latitude;
			this.longitude = longitude;
			this.dongNm = dongNm;
		}
	    
	    public t_safeVO(int safeSeq, String safeAddr, String safeCenter, String safeGungu, String latitude,
				String longitude, String dongNm,String userNm,String itemDeadline,String itemName,int itemSeq,String regDate) {
			super();
			this.safeSeq = safeSeq;
			this.safeAddr = safeAddr;
			this.safeCenter = safeCenter;
			this.safeGungu = safeGungu;
			this.latitude = latitude;
			this.longitude = longitude;
			this.dongNm = dongNm;
			this.userNm = userNm;
			this.itemDeadline = itemDeadline;
			this.itemName = itemName;
			this.itemSeq = itemSeq;
			this.regDate = regDate;
		}
	    
		public String getRegDate() {
			return regDate;
		}


		public void setRegDate(String regDate) {
			this.regDate = regDate;
		}


		public String getUserNm() {
			return userNm;
		}

		public void setUserNm(String userNm) {
			this.userNm = userNm;
		}


		public String getItemDeadline() {
			return itemDeadline;
		}


		public void setItemDeadline(String itemDeadline) {
			this.itemDeadline = itemDeadline;
		}


		public String getItemName() {
			return itemName;
		}


		public void setItemName(String itemName) {
			this.itemName = itemName;
		}


		public int getItemSeq() {
			return itemSeq;
		}


		public void setItemSeq(int itemSeq) {
			this.itemSeq = itemSeq;
		}


		public int getSafeSeq() {
			return safeSeq;
		}
		public void setSafeSeq(int safeSeq) {
			this.safeSeq = safeSeq;
		}
		public String getSafeAddr() {
			return safeAddr;
		}
		public void setSafeAddr(String safeAddr) {
			this.safeAddr = safeAddr;
		}
		public String getSafeCenter() {
			return safeCenter;
		}
		public void setSafeCenter(String safeCenter) {
			this.safeCenter = safeCenter;
		}
		public String getSafeGungu() {
			return safeGungu;
		}
		public void setSafeGungu(String safeGungu) {
			this.safeGungu = safeGungu;
		}
		public String getLatitude() {
			return latitude;
		}
		public void setLatitude(String latitude) {
			this.latitude = latitude;
		}
		public String getLongitude() {
			return longitude;
		}
		public void setLongitude(String longitude) {
			this.longitude = longitude;
		}
		public String getDongNm() {
			return dongNm;
		}
		public void setDongNm(String dongNm) {
			this.dongNm = dongNm;
		}
		@Override
		public String toString() {
			return "t_safeVO [safeSeq=" + safeSeq + ", safeAddr=" + safeAddr + ", safeCenter=" + safeCenter
					+ ", safeGungu=" + safeGungu + ", latitude=" + latitude + ", longitude=" + longitude + ", dongNm="
					+ dongNm + "]";
		}
	   
	}

