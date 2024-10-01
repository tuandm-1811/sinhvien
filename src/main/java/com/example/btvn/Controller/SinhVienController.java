package com.example.btvn.Controller;

import com.example.btvn.Entity.SinhVien;
import com.example.btvn.Service.SinhVienService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SinhVienController {
  @Autowired
  private SinhVienService sinhVienService;

  @GetMapping("/sinhvien")
  public String getAllSinhVien(Model model) {
    List<SinhVien> sinhVienList = sinhVienService.getAllSinhVien();
    System.out.println(sinhVienList);
    model.addAttribute("sinhVienList", sinhVienList);
    return "sinhvien";
  }
}