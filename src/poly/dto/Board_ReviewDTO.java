package poly.dto;

public class Board_ReviewDTO {

    private String review_seq;
    private String user_seq;
    private String board_seq;
    private String content;
    private String reg_dt;
    private String reg_id;
    private String chg_dt;
    private String chg_id;

    public String getReview_seq() {
        return review_seq;
    }

    public void setReview_seq(String review_seq) {
        this.review_seq = review_seq;
    }

    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getBoard_seq() {
        return board_seq;
    }

    public void setBoard_seq(String board_seq) {
        this.board_seq = board_seq;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReg_dt() {
        return reg_dt;
    }

    public void setReg_dt(String reg_dt) {
        this.reg_dt = reg_dt;
    }

    public String getReg_id() {
        return reg_id;
    }

    public void setReg_id(String reg_id) {
        this.reg_id = reg_id;
    }

    public String getChg_dt() {
        return chg_dt;
    }

    public void setChg_dt(String chg_dt) {
        this.chg_dt = chg_dt;
    }

    public String getChg_id() {
        return chg_id;
    }

    public void setChg_id(String chg_id) {
        this.chg_id = chg_id;
    }
}
