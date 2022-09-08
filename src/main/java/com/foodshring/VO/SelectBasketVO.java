package com.foodshring.VO;

public class SelectBasketVO {
	// 장바구니 순번
	private int basketSeq;
	// 아이템 순번
	private int itemSeq;
	// 회원 아이디
	private String mbId;
	// 등록 일자
	private String regString;
	// 판매 유무
	private String mbSales;
	// 아이템 이름
	private String itemName;
	// 아이템 가격
	private int itemPrice;
	// 아이템 카테
	private String itemCate;
	// 아이템 사진
	private String itemImg1;
	
	//결재 성공여부
	private String authyn;
	
	// 결재금액
	private String amt;
	
	//결재시간
	private String trddttm;
	
	public SelectBasketVO(int basketSeq, int itemSeq, String mbId, String regString, String mbSales, String itemName,
			int itemPrice, String itemCate, String itemImg1) {
		this.basketSeq = basketSeq;
		this.itemSeq = itemSeq;
		this.mbId = mbId;
		this.regString = regString;
		this.mbSales = mbSales;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemCate = itemCate;
		this.itemImg1 = itemImg1;
	}
	
	

	
	
	public SelectBasketVO(int basketSeq, int itemSeq, String mbId, String regString, String mbSales, String itemName,
			int itemPrice, String itemCate, String itemImg1,String authyn,String amt,String trddttm) {
		this.basketSeq = basketSeq;
		this.itemSeq = itemSeq;
		this.mbId = mbId;
		this.regString = regString;
		this.mbSales = mbSales;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemCate = itemCate;
		this.itemImg1 = itemImg1;
		this.authyn = authyn;
		this.amt = amt;
		this.trddttm = trddttm;
	}
	
	
	public SelectBasketVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAuthyn() {
		return authyn;
	}

	public void setAuthyn(String authyn) {
		this.authyn = authyn;
	}

	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	public String getTrddttm() {
		return trddttm;
	}

	public void setTrddttm(String trddttm) {
		this.trddttm = trddttm;
	}

	public int getBasketSeq() {
		return basketSeq;
	}
	public void setBasketSeq(int basketSeq) {
		this.basketSeq = basketSeq;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public String getRegString() {
		return regString;
	}
	public void setRegString(String regString) {
		this.regString = regString;
	}
	public String getMbSales() {
		return mbSales;
	}
	public void setMbSales(String mbSales) {
		this.mbSales = mbSales;
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
	public String getItemImg1() {
		return itemImg1;
	}
	public void setItemImg1(String itemImg1) {
		this.itemImg1 = itemImg1;
	}
	
	
}
