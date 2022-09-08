package com.foodshring.VO;

public class t_communittyPageVO {
    private int currentPage;
    private int pageSize;
    private int totalCount;
    private int startRow;
    private int endRow;
    private int allPage;
    private int block;
    private int startPage;
    private int endPage;
    
    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public int getBlock() {
        return block;
    }

    public void setBlock(int block) {
        this.block = block;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        makePaging();
    }

    private void makePaging() {
        pageSize = 10; 

        startRow = (currentPage * pageSize) - (pageSize - 1);
     
        endRow = (currentPage * pageSize);

        allPage = (int)Math.ceil(totalCount / (double)pageSize);

        block = 10; 

        startPage = ((currentPage - 1) / block * block) + 1; 

        endPage = ((currentPage - 1) / block * block) + block; 

        if (endPage > allPage) {
            endPage = allPage;
        }
    }
    
}
