package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;
import poly.dto.ReviewDTO;
import poly.service.IMovieService;
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
        log.info("mid : " + mid);

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

        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + ".getMovieDetail End");

        return "movie/movieDetail";
    }
}
