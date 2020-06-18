package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.MovieDetailDTO;
import poly.service.IMovieService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SerchController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MovieService")
    private IMovieService movieService;

    @RequestMapping(value = "/getSerchList")
    public String getSerchList(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {

        String keyword = request.getParameter("keyword");

        List<MovieDetailDTO> sList = movieService.getMovieSerch(keyword);

        log.info("sList : " + sList.size());

        if (sList == null) {
            sList = new ArrayList<MovieDetailDTO>();
        }
        model.addAttribute("sList", sList);


        return "/serch";
    }
}
