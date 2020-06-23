package poly.dto;

public class ReviewDTO {

    private String review_seq;
    private String user_seq;
    private String movie_id;
    private String content;
    private String reg_dt;
    private String reg_id;
    private String chg_dt;
    private String chg_id;
    private String review_point;

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

    public String getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(String movie_id) {
        this.movie_id = movie_id;
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

    public String getReview_point() {
        return review_point;
    }

    public void setReview_point(String review_point) {
        this.review_point = review_point;
    }
}
