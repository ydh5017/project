package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.MovieDTO;
import poly.service.IMovieService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MovieService")
    private IMovieService movieService;

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
    public  String Serch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.info(this.getClass());

        return "/serch";
    }

    @RequestMapping(value = "mymovie")
    public  String myMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.info(this.getClass());

        return "/mymovie";
    }


}
