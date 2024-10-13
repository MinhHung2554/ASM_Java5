package com.demo.controller;


import com.demo.model.Account;
import com.demo.repo.AccountRepo;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountRepo accountRepo;

    private List<Account> list = new ArrayList<>();

    @GetMapping("/danh-sach")
    public String danhSach(Model model){
        list = accountRepo.findAll();
        model.addAttribute("listAccount",list);
        return "account/list";
    }

    @GetMapping("/add")
    public String viewAdd(Model model){
        model.addAttribute("account",new Account());
        return "account/add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("account") Account account, BindingResult rs){
        if(!rs.hasErrors()){
            accountRepo.save(account);
            return "redirect:/account/danh-sach";
        }
        return "account/add";
    }

    @GetMapping("/update/{username}")
    public String viewUpdate(@PathVariable String username,Model model){
        Account account = accountRepo.findById(username).orElse(null);
        model.addAttribute("account",account);
        return "account/update";
    }

    @PostMapping("/update/{username}")
    public String update(@PathVariable String username,@Valid @ModelAttribute("account") Account account, BindingResult rs){
        if(!rs.hasErrors()){
            account.setUsername(username);
            accountRepo.save(account);
            System.out.println(("user: "+account.getUsername()));
            return "redirect:/account/danh-sach";
        }
        System.out.println("user: NOOOO "+account.getUsername());
        return "account/update";
    }

    @GetMapping("/delete/{username}")
    public String delete(@PathVariable String username,Model model){
        accountRepo.deleteById(username);
        return "redirect:/account/danh-sach";
    }
}
