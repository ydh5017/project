package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.PagingDTO;
import poly.dto.UserDTO;
import poly.service.IAdminService;
import poly.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class AdminController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "AdminService")
    private IAdminService adminService;

    @Resource(name = "UserService")
    private IUserService userService;

    /* 회원관리 페이지 */
    @RequestMapping(value = "/UserList")
    public String UserList(HttpServletRequest request, Model model) throws Exception {
        log.info("UserList start");
        int page = Integer.parseInt(request.getParameter("Pno"));
        log.info("page : " + page);
        int listCnt = adminService.UserCount(); // 총 사용자 개수
        log.info(listCnt);
        PagingDTO paging = new PagingDTO();

        paging.pageInfo(page, listCnt);
        HashMap<String, Integer> hMap = new HashMap<>();
        int i = paging.getStartList();
        int j = paging.getListSize();
        hMap.put("startlist", i);
        hMap.put("listsize", j);
        log.info(hMap);
        List<UserDTO> uList = new ArrayList<>();
        try {
            uList = adminService.getUserList(hMap);
            log.info(uList);
        } catch(Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("uList",uList);
        model.addAttribute("paging",paging);

        return "/admin/UserList";
    }

    @RequestMapping(value="/AdminMod")
    public String AdminMod(HttpServletRequest request, Model model, HttpSession session)throws Exception{
        String job=request.getParameter("job");
        String userEmail=request.getParameter("userEmail");
        String userAss=request.getParameter("userAss");
        String Pno=request.getParameter("Pno");
        String msg,url;
        int result=0;
        log.info(job);
        UserDTO uDTO = new UserDTO();
        uDTO.setUserEmail(userEmail);
        /* 관리자권한 */
        if(job.equals("1")||job.equals("2")) {
            if(userAss.equals("1"))
            {
                userAss="0";
                uDTO.setUserAss(userAss);
                result=adminService.Modass(uDTO);
                if(result==1) {
                    msg="관리자 권한을 삭제하였습니다.";
                    url="/UserList.do?Pno="+Pno;
                }else {
                    msg="응 실패";
                    url="/UserList.do?Pno="+Pno;
                }
            }else {
                userAss="1";
                uDTO.setUserAss(userAss);
                result=adminService.Modass(uDTO);
                if(result==1) {
                    msg="관리자 권한을 추가하였습니다.";
                    url="/UserList.do?Pno="+Pno;
                }else {
                    msg="응 실패";
                    url="/UserList.do?Pno="+Pno;
                }
            }
        } /* 회원 정지 */else if(job.equals("4")) {
            userAss="2";
            uDTO.setUserAss(userAss);
            result=adminService.Modass(uDTO);
            if(result==1) {
                msg="정지상태로 만들었습니다.";
                url="/UserList.do?Pno="+Pno;
            }else {
                msg="응 실패";
                url="/UserList.do?Pno="+Pno;
            }
        }/* 회원 정지  해제*/else if(job.equals("3")) {
            userAss="0";
            uDTO.setUserAss(userAss);
            result=adminService.Modass(uDTO);
            if(result==1) {
                msg="정지를 해제했습니다.";
                url="/UserList.do?Pno="+Pno;
            }else {
                msg="응 실패";
                url="/UserList.do?Pno="+Pno;
            }
        } /* 회원 삭제 */else {
            result = userService.userDelete(uDTO);
            if(result==1) {
                msg="회원을 삭제하였습니다.";
                url="/UserList.do?Pno="+Pno;
            }else {
                msg="회원을 삭제하지 못하였습니다.";
                url="/UserList.do?Pno="+Pno;
            }
        }
        log.info(userEmail);
        log.info(session.getAttribute("SS_userEmail"));
        if(userEmail.equals((String)session.getAttribute("SS_userEmail"))) {
            session.setAttribute("SS_userAss",uDTO.getUserAss());
            log.info("test--------------------");
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "/redirect";
    }
}
