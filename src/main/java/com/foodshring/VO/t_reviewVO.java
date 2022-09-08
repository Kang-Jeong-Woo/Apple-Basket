package com.foodshring.VO;

//리뷰
public class t_reviewVO {
	    
	    private int reviewSeq;// 리뷰 순번 
	    private int itemSeq;// 아이템 순번
	    private String reviewContent;// 리뷰 내용
	    private String reviewDate;// 리뷰 작성일자
	    private String mbId; // 리뷰 작성자
	    private int reviewRating; // 리뷰 평점
	    private int reviewCount; // 리뷰카운트
	    private int roundReview; //리뷰평균
	    
		public t_reviewVO() {
			super();
			// TODO Auto-generated constructor stub
		}

		public t_reviewVO(int reviewSeq, int itemSeq, String reviewContent, String reviewDate, String mbId,
				int reviewRating) {
			super();
			this.reviewSeq = reviewSeq;
			this.itemSeq = itemSeq;
			this.reviewContent = reviewContent;
			this.reviewDate = reviewDate;
			this.mbId = mbId;
			this.reviewRating = reviewRating;
		}
		
		public t_reviewVO(int reviewSeq, int itemSeq, String reviewContent, String reviewDate, String mbId,
				int reviewRating,int roundReview,int reviewCount) {
			super();
			this.reviewSeq = reviewSeq;
			this.itemSeq = itemSeq;
			this.reviewContent = reviewContent;
			this.reviewDate = reviewDate;
			this.mbId = mbId;
			this.reviewRating = reviewRating;
			this.roundReview = roundReview;
			this.reviewCount = reviewCount;
		}
		
		public int getReviewCount() {
			return reviewCount;
		}

		public void setReviewCount(int reviewCount) {
			this.reviewCount = reviewCount;
		}

		public int getRoundReview() {
			return roundReview;
		}

		public void setRoundReview(int roundReview) {
			this.roundReview = roundReview;
		}

		public int getReviewSeq() {
			return reviewSeq;
		}

		public void setReviewSeq(int reviewSeq) {
			this.reviewSeq = reviewSeq;
		}

		public int getItemSeq() {
			return itemSeq;
		}

		public void setItemSeq(int itemSeq) {
			this.itemSeq = itemSeq;
		}

		public String getReviewContent() {
			return reviewContent;
		}

		public void setReviewContent(String reviewContent) {
			this.reviewContent = reviewContent;
		}

		public String getReviewDate() {
			return reviewDate;
		}

		public void setReviewDate(String reviewDate) {
			this.reviewDate = reviewDate;
		}

		public String getMbId() {
			return mbId;
		}

		public void setMbId(String mbId) {
			this.mbId = mbId;
		}

		public int getReviewRating() {
			return reviewRating;
		}

		public void setReviewRating(int reviewRating) {
			this.reviewRating = reviewRating;
		}

		@Override
		public String toString() {
			return "t_reviewVO [reviewSeq=" + reviewSeq + ", itemSeq=" + itemSeq + ", reviewContent=" + reviewContent
					+ ", reviewDate=" + reviewDate + ", mbId=" + mbId + ", reviewRating=" + reviewRating + "]";
		}
	    
	}

