package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;
import poly.dto.MyMovieDTO;
import poly.service.IMovieService;
import poly.service.IMyMovieService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MovieService")
    private IMovieService movieService;

    @Resource(name = "MyMovieService")
    private IMyMovieService myMovieService;

    /**
     * 영화 예매순위
     */
    @RequestMapping(value="index")
    public String Index(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        log.info(this.getClass().getName() + ".MovieRank Start");

        log.info(this.getClass().getName() + ".getRank Start");

        List<MovieDTO> rList = new ArrayList<>();
        try {
            rList = movieService.getRank();
            log.info("rList : " + rList.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("rList", rList);


        log.info(this.getClass().getName() + ".getRank End");

        log.info(this.getClass().getName() + ".MovieRank End");

        return "/index";
    }

    @RequestMapping(value = "serch")
    public  String Serch(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
        log.info(this.getClass());

        List<MovieDetailDTO> sList = new ArrayList<MovieDetailDTO>();
        log.info("sList : " + sList.size());

        model.addAttribute("sList", sList);


        return "/serch";
    }

    @RequestMapping(value = "mymovie")
    public  String myMovie(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {

        String user_seq = (String) session.getAttribute("SS_userSeq");
        log.info("user_seq : " + user_seq);

        List<MyMovieDTO> mList = myMovieService.getMyMovieList(user_seq);

        log.info("mList : " + mList.size());

        model.addAttribute("mList", mList);

        return "/mymovie";
    }


}
