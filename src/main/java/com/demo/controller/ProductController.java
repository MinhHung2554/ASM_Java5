package com.demo.controller;

import com.demo.model.Category;
import com.demo.model.Product;
import com.demo.repo.CategoryRepo;
import com.demo.repo.ProductRepo;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    private List<Product> listPro = new ArrayList<>();
    private List<Category> listCate = new ArrayList<>();


    @Autowired
    ProductRepo productRepo;

    @Autowired
    CategoryRepo categoryRepo;

//    @GetMapping("/danh-sach")
//    public String danhSach(Model model) {
//        listPro = productRepo.findAll();
//        model.addAttribute("listPro", listPro);
//        return "product/list";
//    }

    @GetMapping("/hien-thi")
    public String hienThi(@RequestParam(defaultValue = "")String keyword,
                          @RequestParam(defaultValue = "0")Float minPrice,
                          @RequestParam(defaultValue = "0")Float maxPrice,
                          @RequestParam(defaultValue = "0")int p, Model model){
        if(maxPrice == 0) maxPrice = Float.MAX_VALUE;
        Pageable pageable = PageRequest.of(p,3, Sort.by(Sort.Direction.DESC, "price"));
        Page<Product> page = productRepo.search("%" + keyword + "%",minPrice,maxPrice, pageable);//findAll(pageable);
        //System.out.println("list:" + list);
        model.addAttribute("page", page);
        model.addAttribute("pro", new Product());
        return "product/list";
    }

    @ModelAttribute("dsCate")
    public List<Category> getdsCate() {
        listCate = categoryRepo.findAll();
        return listCate;
    }

    @GetMapping("/add")
    public String viewAdd(Model model) {
        model.addAttribute("pro", new Product());
        return "product/add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("pro") Product pro, BindingResult rs) {
        if (!rs.hasErrors()) {
            productRepo.save(pro);
            return "redirect:/product/hien-thi";
        }
        return "product/add";
    }

    @GetMapping("/update/{id}")
    public String viewUpdate(@PathVariable Integer id, Model model) {
        Product pro = productRepo.findById(id).orElse(null);
        model.addAttribute("pro", pro);
        return "product/update";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id, @Valid @ModelAttribute("pro") Product pro, BindingResult rs) {
        if (!rs.hasErrors()) {
            pro.setId(id);
            productRepo.save(pro);
            return "redirect:/product/hien-thi";
        }
        return "product/update";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, Model model) {
        productRepo.deleteById(id);
        return "redirect:/product/hien-thi";
    }
}
