//
//  MainViewModel.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation


// View in ViewModele Soyledikleri
protocol MainViewModelProtocol  : AnyObject {
    var delegate : MainViewModelDelegate? { get set}
    func didLoad() // Fetch Coredata
    func didSelectRow(at indexPath : IndexPath) // secime gore ekrani goster
}

// Burada viewmodel veri cikisi formatlama
// Datadan sadece gosterilecek kisim View de olsunda
// Soru : Veri yoksa gosterilecek viewi nasil yapayim ?

enum MainViewModelOutput {
    case showBooks([MainPresentation])
        // case showDescription olabilir
}

// MARK:  ROUTE
enum MainViewRoute {
    case showDetail(Result)
}
// ViewModelin View a soyledikleri
protocol MainViewModelDelegate : AnyObject {
    func handleOutput(_ output : MainViewModelOutput)
    func navigate(to route : MainViewRoute)
}
// MVC de viewcontroller icinde olunca direk navigation ile routelama yapildi fakat MVVM de protocol yapisi gozeterek rootlamak lazim
// MainView Kac farkli ekrana gecebiliyorsa o kadar route belirlemek gerekiyor


// View model - View Controller arasi delegate  handleOutput vardi.
// Ne ise yariyordu ? ekrana gosterilecek veriyi geciyordu
