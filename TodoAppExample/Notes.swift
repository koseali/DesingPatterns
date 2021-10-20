//
//  Notes.swift
//  TodoAppExample
//
//  Created by Ali Kose on 11.10.2021.
//

import Foundation
/*
 GERCEKLESTIRILENLER
 CORE DATA SILME EKLEME DUZENLEME SIRALAMA ARAMA 
 
 1. Ekran: (Liste Ekranı:)
 ⁃ VIPER patterni ile yazılmalıdır.
 + Todo list itemları arasında arama yapılabilmelidir.
 + Todo list itemları sıralama butonu ile düzenlenme tarihine göre sıralanabilmelidir.
 ⁃ Sadece todo list itemları güncellendiğinde görünüm güncellenmelidir. (Ekrana her girişte güncelleme olmamalı)
 
 
 2. ekran: (Detay Ekranı:)
 ⁃ MVVM patterni ile yazılmalıdır.
 + Todo için title, detail, tamamlama zamanı bilgileri girilecektir. ⁃ Edit ve Add işlemleri için aynı ekran kullanılacaktır.
 
 Git Kullanımı:
 - Uygulama github.com sayfasına public repo olarak yüklenmelidir.
  
 ⁃ Bunu Ekleyecegim Date Picker Deneyip :Tamamlama zamanı ayarlanmış todo'nun zamanı geldiğinde uygulamada local push notification gösterilmelidir.
 
 + Notification yönetimi bir localNotificationManager aracılığıyla yapılmalıdır.
 
 ⁃ viewModel localNotificationManager’a notificationManager protokolü üzerinden
 erişmelidir.
 + Todo title’ı eklenmemişse todo kaydedilmemelidir. Hepsi eklenmediyse seklinde yaptik ama caizdir herhalde
 
 BONUS :
 
 - Unit TEst Yazimi
 - Ekran Gecisleri Animasyon
 
 
 */
