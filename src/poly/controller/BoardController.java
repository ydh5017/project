package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.BoardDTO;
import poly.dto.PagingDTO;
import poly.service.IBoardService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class BoardController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name="BoardService")
    private IBoardService boardservice;
    //게시판
    @RequestMapping(value="/board")
    public String board(HttpServletRequest request, Model model)throws Exception{
        // 페이징
        int page = Integer.parseInt(request.getParameter("Pno"));
        log.info("Pno : " + page);
        int listCnt = boardservice.TotalCount(); // 총 게시글 개수
        log.info("listCnt : " + listCnt);

        PagingDTO paging = new PagingDTO();

        paging.pageInfo(page, listCnt);
        HashMap<String, Integer> hMap = new HashMap<>();
        int i = paging.getStartList();
        int j = paging.getListSize();
        hMap.put("startlist", i);
        hMap.put("listsize", j);
        log.info("hMap : " + hMap);

        List<BoardDTO> bList = new ArrayList<>();
        try {
            bList = boardservice.getBoardList(hMap);
            log.info(bList);
        } catch(Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bList",bList);
        model.addAttribute("paging",paging);

        return "/board/board";
    }
    //게시글 추가
    @RequestMapping(value="/boardAdd")
    public String boardAdd(HttpServletRequest request,Model model)throws Exception{
        String board_seq=(String)request.getParameter("board_seq");
        if(board_seq==null)
            board_seq="0";
        log.info(board_seq);
        model.addAttribute(board_seq);
        return "/board/boardAdd";
    }
    @RequestMapping(value="/boardAddproc")
    public String boardAddproc(HttpServletRequest request, Model model, HttpSession session)throws Exception{
        String board_title=request.getParameter("board_title");
        String board_content=request.getParameter("board_content");
        String board_notice=request.getParameter("board_notice");
        String reg_id=(String)session.getAttribute("SS_userEmail");
        String user_seq=(String)session.getAttribute("SS_userSeq");
        log.info(board_notice);
        log.info(board_content);
        log.info(board_title);
        log.info(reg_id);
        log.info(user_seq);

        BoardDTO bDTO =new BoardDTO();
        bDTO.setBoard_title(board_title.replace("script",""));
        bDTO.setBoard_content(board_content);
        bDTO.setBoard_notice(board_notice);
        bDTO.setReg_id(reg_id);
        bDTO.setUser_seq(user_seq);
        int result = 0;

        String msg, url;
        result=boardservice.boardAddproc(bDTO);
        log.info(result);
        if(result ==1) {
            msg="게시물 등록 성공";
            url="/board.do?Pno=1";
        }else {
            msg="게시물 등록 실패";
            url="/boardAdd.do";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("url",url);

        return "/redirect";
    }
    //게시글 상세보기
    @RequestMapping(value="/boardDetail")
    public String boardDetail(HttpServletRequest request,Model model,HttpSession session)throws Exception{
        String board_seq=request.getParameter("no");
        log.info(board_seq);
        BoardDTO bDTO =new BoardDTO();
        bDTO.setBoard_seq(board_seq);
        bDTO = boardservice.boardDetail(bDTO);
        int count=Integer.parseInt(bDTO.getBoard_count());
        count++;
        bDTO.setBoard_count(Integer.toString(count));
        int result=boardservice.count(bDTO);
        log.info(result);
        log.info(bDTO.getBoard_content());
        log.info(bDTO.getBoard_title());
        log.info(bDTO.getBoard_count());
        log.info(bDTO.getReg_id());
        model.addAttribute("board_title",bDTO.getBoard_title());
        model.addAttribute("board_content",bDTO.getBoard_content());
        model.addAttribute("board_count",bDTO.getBoard_count());
        model.addAttribute("reg_dt",bDTO.getReg_dt());
        model.addAttribute("reg_id",bDTO.getReg_id());
        model.addAttribute("board_seq",bDTO.getBoard_seq());
        model.addAttribute("chg_dt",bDTO.getChg_dt());

        // 페이징
        int page = Integer.parseInt(request.getParameter("Pno"));
        int listCnt = boardservice.TotalCount(); // 총 게시글 개수

        PagingDTO paging = new PagingDTO();

        paging.pageInfo(page, listCnt);
        HashMap<String, Integer> hMap = new HashMap<>();
        int i = paging.getStartList();
        int j = paging.getListSize();
        hMap.put("startlist", i);
        hMap.put("listsize", j);

        List<BoardDTO> bList = new ArrayList<>();
        try {
            bList = boardservice.getBoardList(hMap);
            log.info(bList);
        } catch(Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("bList",bList);
        model.addAttribute("paging",paging);

        return "/board/boardDetail";
    }

    @RequestMapping(value="/boardDelete")
    public String boardDelete(HttpServletRequest request,Model model,HttpSession session)throws Exception{
        String board_seq=request.getParameter("board_seq");
        log.info(board_seq);
        BoardDTO bDTO=new BoardDTO();
        bDTO.setBoard_seq(board_seq);
        String msg, url;
        int result=0;
        result=boardservice.boardDelete(bDTO);
        log.info(result);
        if(result==1) {
            msg="글이 삭제되었습니다.";
            url="/board.do?Pno=1";
        }else {
            msg="글 삭제에 실패하었습니다.";
            url="/boardDetail.do?no="+board_seq+"&Pno=1";
        }


        model.addAttribute("msg",msg);
        model.addAttribute("url",url);

        return "/redirect";

    }
    //게시글 수정
    @RequestMapping(value="/boardMod")
    public String boardMod(HttpServletRequest request,Model model)throws Exception{
        String board_seq=request.getParameter("board_seq");
        log.info(board_seq);
        BoardDTO bDTO =new BoardDTO();
        bDTO.setBoard_seq(board_seq);
        bDTO=boardservice.boardDetail(bDTO);
        model.addAttribute("board_title",bDTO.getBoard_title());
        model.addAttribute("board_content",bDTO.getBoard_content());
        model.addAttribute("baord_notice",bDTO.getBoard_notice());
        model.addAttribute("board_seq",bDTO.getBoard_seq());
        log.info(bDTO.getBoard_seq());
        return "/board/boardMod";
    }
    @RequestMapping(value="/boardModproc")
    public String boardModproc(HttpServletRequest request,HttpSession session,Model model)throws Exception{
        String board_seq=request.getParameter("board_seq");
        String board_title=request.getParameter("board_title");
        String board_content=request.getParameter("board_content");
        String board_notice=request.getParameter("board_notice");
        String user_seq=(String)session.getAttribute("SS_userSeq");
        BoardDTO bDTO=new BoardDTO();
        bDTO.setBoard_seq(board_seq);
        bDTO.setBoard_title(board_title);
        bDTO.setBoard_content(board_content);
        bDTO.setBoard_notice(board_notice);
        bDTO.setChg_id(user_seq);
        log.info(board_seq);
        log.info(board_title);
        log.info(board_content);
        log.info(board_notice);
        log.info(user_seq);

        String msg,url;
        int result=0;


        result=boardservice.boardMod(bDTO);
        log.info(result);
        if(result==1) {
            msg="글이 수정되었습니다.";
            url="/boardDetail.do?no="+board_seq+"&Pno=1";
        }else {
            msg="글 수정에 실패하었습니다.";
            url="/boardDetail.do?no="+board_seq;
        }


        model.addAttribute("msg",msg);
        model.addAttribute("url",url);

        return "/redirect";

    }
}
