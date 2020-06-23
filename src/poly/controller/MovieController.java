package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;
import poly.dto.MyMovieDTO;
import poly.dto.ReviewDTO;
import poly.service.IMovieService;
import poly.service.IMyMovieService;
import poly.service.IReviewService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MovieController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MovieService")
    private IMovieService movieService;

    @Resource(name = "ReviewService")
    private IReviewService reviewService;

    @Resource(name = "MyMovieService")
    private IMyMovieService myMovieService;

    /**
     * 예매순위 수집
     */
    @RequestMapping(value = "movie/collectMovieRank")
    @ResponseBody
    public String collectMovieRank(HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".collectMovieRank Start!");

        movieService.collectMovieRank();

        log.info(this.getClass().getName() + ".collectMovieRank End!");

        return "success";
    }

    /**
     * 영화 데이터 가져오기
     */
    @RequestMapping(value = "movie/getRank")
    @ResponseBody
    public List<MovieDTO> getRank(HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".getRank Start");

        List<MovieDTO> rList = movieService.getRank();

        if (rList == null) {
            rList = new ArrayList<MovieDTO>();
        }

        log.info(this.getClass().getName() + ".getRank End");
        System.out.println("rList : " + rList.size());

        return rList;
    }

    /**
     * 영화 상세정보 수집
     */
    @RequestMapping(value = "movie/collectMovieDetail")
    @ResponseBody
    public String collectMovieDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".collectMovieDetail Start!");

        movieService.collectMovieDetail();

        log.info(this.getClass().getName() + ".collectMovieDetail End!");

        return "success";
    }

    /**
     * 영화 상세데이터 가져오기
     */
    @RequestMapping(value = "movie/getMovieDetail")
    @ResponseBody
    public List<MovieDetailDTO> getMovieDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".getMovieDetail Start");

        List<MovieDetailDTO> rList = movieService.getMovieDetail();

        if (rList == null) {
            rList = new ArrayList<MovieDetailDTO>();
        }

        log.info(this.getClass().getName() + ".getMovieDetail End");
        System.out.println("rList : " + rList.size());

        return rList;
    }

    @RequestMapping(value = "/movieDetail")
    public String movieDetail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {

        String mid = request.getParameter("mid");
        String user_seq = (String) session.getAttribute("SS_userSeq");
        log.info("mid : " + mid);
        log.info("user_seq : " + user_seq);

        log.info(this.getClass().getName() + ".getMovieDetail Start");

        List<MovieDetailDTO> mList = movieService.getMovieInfo(mid);

        log.info("mList : " + mList.size());

        model.addAttribute("mList", mList);

        HashMap<String, String> rMap = new HashMap<>();
        rMap.put("mid", mid);
        List<ReviewDTO> rList = new ArrayList<>();

        try {
            rList = reviewService.getReviewList(rMap);
            log.info(rList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        float sum = 0;
        float average2 = 0;

        for (int i = 0; i < rList.size(); i++) {
            String POINT = rList.get(i).getReview_point();
            float point = Float.parseFloat(POINT);

            sum = sum + point;
        }

        if (rList.size() == 0){
            average2 = 0;
        } else {
            average2 = sum / rList.size();
        }

        String average = String.format("%.1f", average2);

        log.info("rList : " + rList.size());
        log.info("average : " + average);

        model.addAttribute("rList", rList);
        model.addAttribute("average", average);

        HashMap<String, String> yMap = new HashMap<>();
        yMap.put("mid", mid);
        yMap.put("user_seq", user_seq);
        List<MyMovieDTO> yList = new ArrayList<>();
        try {
            yList = myMovieService.mymovieCheck(yMap);
            log.info(yList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        log.info("yList : " + yList.size());

        model.addAttribute("yList", yList);

        log.info(this.getClass().getName() + ".getMovieDetail End");

        return "movie/movieDetail";
    }

    @RequestMapping(value = "/MYmovieDetail")
    public String MYmovieDetail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {

        String mid = request.getParameter("mid");
        String user_seq = (String) session.getAttribute("SS_userSeq");
        log.info("mid : " + mid);
        log.info("user_seq : " + user_seq);

        log.info(this.getClass().getName() + ".getMovieDetail Start");

        List<MovieDetailDTO> mList = movieService.getMovieInfo(mid);

        log.info("mList : " + mList.size());
        log.info("mList : " + mList);

        String msg, url;

        if (mid.equals(String.valueOf(mList.get(0).getMid()))){
            msg = "ㄱㄱ";
            url = "/movieDetail.do?mid=" + mid;
        } else {
            msg = "현재 상영중인 영화가 아닙니다.";
            url = "/mymovie.do";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);


        return "/redirect";
    }
}
