package poly.dto;

public class MovieDetailDTO {

    private String collect_time; // 수집 시간
    private String mid; // 영화 id
    private String title; // 영화 제목
    private String mv_info; // 상세 정보
    private String director; // 감독
    private String actor; // 출연
    private String h_context; // 줄거리 헤드
    private String context; // 줄거리
    private String image; //영화 포스터
    private String backimg; // 배경

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBackimg() {
        return backimg;
    }

    public void setBackimg(String backimg) {
        this.backimg = backimg;
    }

    public String getH_context() {
        return h_context;
    }

    public void setH_context(String h_context) {
        this.h_context = h_context;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getCollect_time() {
        return collect_time;
    }

    public void setCollect_time(String collect_time) {
        this.collect_time = collect_time;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMv_info() {
        return mv_info;
    }

    public void setMv_info(String mv_info) {
        this.mv_info = mv_info;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }
}
