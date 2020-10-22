package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ChatController {

    private Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "/chat")
    public String chat(HttpServletRequest request, Model model) throws Exception {

        return "/chat/chat";
    }
}
