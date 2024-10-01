package com.example.btvn.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "SinhVien")
public class SinhVien {
  @Id
  @Column(name= "MaSV")
  private String maSV;
  @Column(name= "SoCMT")
  private String soCMT;
  @Column(name= "NgaySinh")
  private Date ngaySinh;
  @Column(name= "Lop")
  private String lop;
  @Column(name= "QueQuan")
  private String queQuan;
}
