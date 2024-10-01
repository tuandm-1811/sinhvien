package com.example.btvn.Service;


import com.example.btvn.Entity.SinhVien;
import com.example.btvn.Repository.SinhVienRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SinhVienService {
  @Autowired
  private SinhVienRepository sinhVienRepository;

  public List<SinhVien> getAllSinhVien() {
    return sinhVienRepository.findAll();
  }
}
