package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.swing.*;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("center", "center");
        return "index";
    }



    @RequestMapping("/women")
    public String womens(Model model){
        model.addAttribute("center", "women");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model){
        model.addAttribute("center", "about");
        return "index";
    }

    @RequestMapping("/contact")
    public String contact(Model model){
        model.addAttribute("center", "contact");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center", "login/login");
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model){
        model.addAttribute("center", "login/loginSuccess");
        return "index";
    }





}
