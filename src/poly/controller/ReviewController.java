package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.ReviewDTO;
import poly.service.IReviewService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "ReviewService")
    private IReviewService reviewService;

    @RequestMapping(value = "/ReviewAdd")
    public String ReviewAdd(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String reg_id = (String) session.getAttribute("SS_userEmail");
        String user_seq = (String) session.getAttribute("SS_userSeq");
        String mid = request.getParameter("mid");
        String content = request.getParameter("gradeTxt");

        log.info("mid : " + mid);
        log.info("reg_id : " + reg_id);
        log.info("user_seq : " + user_seq);
        log.info("content : " + content);

        ReviewDTO rDTO = new ReviewDTO();

        rDTO.setMovie_id(mid);
        rDTO.setContent(content);
        rDTO.setReg_id(reg_id);
        rDTO.setUser_seq(user_seq);

        int result = 0;

        String msg, url;
        result = reviewService.reviewAdd(rDTO);
        log.info("result : " + result);
        if (result == 1) {
            msg = "리뷰를 등록하였습니다.";
            url = "movieDetail.do?mid=" + mid;
        } else {
            msg = "리뷰를 등록에 실패하였습니다.";
            url = "movieDetail.do?mid=" + mid;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }

    @RequestMapping(value = "/reviewDel")
    public String reviewDel(HttpServletRequest request,Model model) throws Exception {

        ReviewDTO rDTO = new ReviewDTO();
        rDTO.setReview_seq(request.getParameter("Rno"));
        log.info("review_seq : " + request.getParameter("Rno"));

        String mid = request.getParameter("mid");
        log.info("mid : " + mid);

        int res=0;

        String msg,url;

        res = reviewService.reviewDel(rDTO);

        if(res==1) {
            msg = "리뷰를 삭제하였습니다.";
            url = "/movieDetail.do?mid=" + mid;
        } else {
            msg = "리뷰 삭제를 실패하였습니다.";
            url = "/movieDetail.do?mid=" + mid;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }

    @RequestMapping(value = "/reviewMod")
    public String reviewMod(HttpServletRequest request,Model model,HttpSession session) throws Exception {

        ReviewDTO rDTO = new ReviewDTO();

        String content = request.getParameter("RMcontent");
        String review_seq = request.getParameter("review_seq");
        rDTO.setReview_seq(review_seq);
        rDTO.setContent(content);

        int res = 0;

        String mid = request.getParameter("mid");

        log.info("mid : " + mid);
        log.info("review_seq : " +review_seq);
        log.info("content : " + content);

        String msg, url;

        res = reviewService.reviewMod(rDTO);

        if (res == 1) {
            msg = "리뷰를 수정하였습니다.";
            url ="/movieDetail.do?mid=" + mid;
        } else {
            msg = "리뷰 수정을 실패하였습니다.";
            url ="/movieDetail.do?mid=" + mid;
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }
}

