package com.foodshring.VO;

// 장바구니
public class t_basketVO {
	
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
	
	public t_basketVO(int basketSeq, int itemSeq, String mbId, String regString, String mbSales) {
		this.basketSeq = basketSeq;
		this.itemSeq = itemSeq;
		this.mbId = mbId;
		this.regString = regString;
		this.mbSales = mbSales;
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
	
}
