package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.Board_ReviewDTO;
import poly.service.IBoard_ReviewService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class Board_ReviewController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "Board_ReviewService")
    private IBoard_ReviewService board_reviewService;

    @RequestMapping(value = "/Board_ReviewAdd")
    public String Board_ReviewAdd(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String reg_id = (String) session.getAttribute("SS_userEmail");
        String user_seq = (String) session.getAttribute("SS_userSeq");
        String board_seq = request.getParameter("board_seq");
        String content = request.getParameter("gradeTxt");

        log.info("board_seq : " + board_seq);
        log.info("reg_id : " + reg_id);
        log.info("user_seq : " + user_seq);
        log.info("content : " + content);
        Board_ReviewDTO rDTO = new Board_ReviewDTO();

        rDTO.setBoard_seq(board_seq);
        rDTO.setContent(content);
        rDTO.setReg_id(reg_id);
        rDTO.setUser_seq(user_seq);

        int result = 0;

        String msg, url;
        result = board_reviewService.reviewAdd(rDTO);
        log.info("result : " + result);
        if (result == 1) {
            msg = "리뷰를 등록하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        } else {
            msg = "리뷰를 등록에 실패하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }

    @RequestMapping(value = "/Board_reviewDel")
    public String Bpard_reviewDel(HttpServletRequest request,Model model) throws Exception {

        Board_ReviewDTO rDTO = new Board_ReviewDTO();
        rDTO.setReview_seq(request.getParameter("Rno"));
        log.info("review_seq : " + request.getParameter("Rno"));

        String board_seq = request.getParameter("board_seq");
        log.info("board_seq : " + board_seq);

        int res=0;

        String msg,url;

        res = board_reviewService.reviewDel(rDTO);

        if(res==1) {
            msg = "리뷰를 삭제하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        } else {
            msg = "리뷰 삭제를 실패하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }

    @RequestMapping(value = "/Board_reviewMod")
    public String Board_reviewMod(HttpServletRequest request,Model model,HttpSession session) throws Exception {

        Board_ReviewDTO rDTO = new Board_ReviewDTO();

        String content = request.getParameter("RMcontent");
        String review_seq = request.getParameter("review_seq");

        rDTO.setReview_seq(review_seq);
        rDTO.setContent(content);

        int res = 0;

        String board_seq = request.getParameter("board_seq");

        log.info("board_seq : " + board_seq);
        log.info("review_seq : " +review_seq);
        log.info("content : " + content);

        String msg, url;

        res = board_reviewService.reviewMod(rDTO);

        if (res == 1) {
            msg = "리뷰를 수정하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        } else {
            msg = "리뷰 수정을 실패하였습니다.";
            url = "boardDetail.do?no=" + board_seq;
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "/redirect";
    }
}
