package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.MyMovieDTO;
import poly.service.IMyMovieService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MyMovieController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MyMovieService")
    private IMyMovieService myMovieService;

    @RequestMapping(value = "/mymovieAdd")
    public String mymovieAdd(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String reg_id = (String) session.getAttribute("SS_userEmail");
        String user_seq = (String) session.getAttribute("SS_userSeq");
        String mid = request.getParameter("mid");
        String title = request.getParameter("title");
        String mv_info = request.getParameter("mv_info");
        String director = request.getParameter("director");
        String actor = request.getParameter("actor");
        String image = request.getParameter("image");
        String backimg = request.getParameter("backimg");
        String h_context = request.getParameter("h_context");
        String context = request.getParameter("context");

        log.info("mid : " + mid);
        log.info("title : " + title);
        log.info("mv_info : " + mv_info);
        log.info("director : " + director);
        log.info("actor : " + actor);
        log.info("image : " + image);
        log.info("backimg : " + backimg);
        log.info("h_context : " + h_context);
        log.info("context : " + context);
        log.info("user_seq : " + user_seq);

        MyMovieDTO mDTO = new MyMovieDTO();

        mDTO.setMovie_id(mid);
        mDTO.setTitle(title);
        mDTO.setMv_info(mv_info);
        mDTO.setDirector(director);
        mDTO.setActor(actor);
        mDTO.setImage(image);
        mDTO.setBackimg(backimg);
        mDTO.setH_context(h_context);
        mDTO.setContext(context);
        mDTO.setUser_seq(user_seq);

        int result = 0;

        String msg, url;
        result = myMovieService.mymovieAdd(mDTO);
        log.info("result : " + result);
        if (result == 1) {
            msg = "나의 영화를 등록하였습니다.";
            url = "movieDetail.do?mid=" + mid;
        }else {
            msg = "나의 영화를 등록에 실패하였습니다.";
            url = "movieDetail.do?mid=" + mid;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";

    }

    @RequestMapping(value = "/mymovieDel")
    public String mymovieDel(HttpServletRequest request,Model model) throws Exception {

        MyMovieDTO mDTO = new MyMovieDTO();
        mDTO.setMymovie_seq(request.getParameter("mymovie_seq"));
        log.info("mymovie_seq : " + request.getParameter("mymovie_seq"));

        String mid = request.getParameter("mid");
        log.info("mid : " + mid);

        int res = 0;

        String msg, url;

        res = myMovieService.mymovieDel(mDTO);

        if (res == 1) {
            msg = "나의 영화 등록을 취소하였습니다.";
            url = "/movieDetail.do?mid=" + mid;
        }else {
            msg = "앙 실패띠~";
            url = "/movieDetail.do?mid=" + mid;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }

    @RequestMapping(value = "/mymovieListDel")
    public String mymovieListDel(HttpServletRequest request,Model model) throws Exception {

        MyMovieDTO mDTO = new MyMovieDTO();
        mDTO.setMymovie_seq(request.getParameter("mymovie_seq"));
        log.info("mymovie_seq : " + request.getParameter("mymovie_seq"));

        String mid = request.getParameter("mid");
        log.info("mid : " + mid);

        int res = 0;

        String msg, url;

        res = myMovieService.mymovieListDel(mDTO);

        if (res == 1) {
            msg = "나의 영화 목록에서 삭제하였습니다.";
            url = "/mymovie.do";
        }else {
            msg = "앙 실패띠.";
            url = "/mymovie.do";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }
}
