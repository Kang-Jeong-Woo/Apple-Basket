package com.foodshring.VO;

public class t_itemJoinVO {

	private int itemSeq;
	// 아이템 이름
	private String itemName;
	// 아이템 가격
	private int itemPrice;
	// 아이템 카테고리
	private String itemCate;
	// 아이템 판매자
	private String mbId;
	// 아이템 마감시한
	private String itemDeadline;
	// 등록 날짜
	private String regString;
	// 아이템 사진1
	private String itemImg1;
	// 아이템 사진2
	private String itemImg2;
	// 아이템 사진3
	private String itemImg3;
	// 아이템 설명
	private String itemDesc;
	// 아이템 수량
	private int itemQuant;
	// 신청자 수
	private int curQuant;
	// 아이템 플래그
	private String itemFlag;
	// 안전주소 순번
	private int safeSeq;
	/* 순번 */
	private String safeAddr; 
	/* 주소 */
	private String safeCenter; 
	/* 중심지 */
	private String safeGungu; 
	/* 군구 */
	private String latitude; 
	/* 위도 */
	private String longitude; 
	/* 경도 */
	
	


	public t_itemJoinVO(int itemSeq, String itemName, int itemPrice, String itemCate, String mbId, String itemDeadline,
			String regString, String itemImg1, String itemImg2, String itemImg3, String itemDesc, int itemQuant,
			int curQuant, String itemFlag, int safeSeq, String safeAddr, String safeCenter, String safeGungu,
			String latitude, String longitude) {
	
		this.itemSeq = itemSeq;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemCate = itemCate;
		this.mbId = mbId;
		this.itemDeadline = itemDeadline;
		this.regString = regString;
		this.itemImg1 = itemImg1;
		this.itemImg2 = itemImg2;
		this.itemImg3 = itemImg3;
		this.itemDesc = itemDesc;
		this.itemQuant = itemQuant;
		this.curQuant = curQuant;
		this.itemFlag = itemFlag;
		this.safeSeq = safeSeq;
		this.safeAddr = safeAddr;
		this.safeCenter = safeCenter;
		this.safeGungu = safeGungu;
		this.latitude = latitude;
		this.longitude = longitude;
		

	}

	public int getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemCate() {
		return itemCate;
	}

	public void setItemCate(String itemCate) {
		this.itemCate = itemCate;
	}

	public String getMbId() {
		return mbId;
	}

	public void setMbId(String mbId) {
		this.mbId = mbId;
	}

	public String getItemDeadline() {
		return itemDeadline;
	}

	public void setItemDeadline(String itemDeadline) {
		this.itemDeadline = itemDeadline;
	}

	public String getRegString() {
		return regString;
	}

	public void setRegString(String regString) {
		this.regString = regString;
	}

	public String getItemImg1() {
		return itemImg1;
	}

	public void setItemImg1(String itemImg1) {
		this.itemImg1 = itemImg1;
	}

	public String getItemImg2() {
		return itemImg2;
	}

	public void setItemImg2(String itemImg2) {
		this.itemImg2 = itemImg2;
	}

	public String getItemImg3() {
		return itemImg3;
	}

	public void setItemImg3(String itemImg3) {
		this.itemImg3 = itemImg3;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public int getItemQuant() {
		return itemQuant;
	}

	public void setItemQuant(int itemQuant) {
		this.itemQuant = itemQuant;
	}

	public int getCurQuant() {
		return curQuant;
	}

	public void setCurQuant(int curQuant) {
		this.curQuant = curQuant;
	}

	public String getItemFlag() {
		return itemFlag;
	}

	public void setItemFlag(String itemFlag) {
		this.itemFlag = itemFlag;
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

	@Override
	public String toString() {
		return "t_itemJoinVO [itemSeq=" + itemSeq + ", itemName=" + itemName + ", itemPrice=" + itemPrice
				+ ", itemCate=" + itemCate + ", mbId=" + mbId + ", itemDeadline=" + itemDeadline + ", regString="
				+ regString + ", itemImg1=" + itemImg1 + ", itemImg2=" + itemImg2 + ", itemImg3=" + itemImg3
				+ ", itemDesc=" + itemDesc + ", itemQuant=" + itemQuant + ", curQuant=" + curQuant + ", itemFlag="
				+ itemFlag + ", safeSeq=" + safeSeq + ", safeAddr=" + safeAddr + ", safeCenter=" + safeCenter
				+ ", safeGungu=" + safeGungu + ", latitude=" + latitude + ", longitude=" + longitude + ", dongNm="
				+ "]";
	}

}