//
//  DetailContracts.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

// ViewModelin View e Soyledikleri DetailViewmodelOutputProtocol
protocol DetailViewModelDelegate : NSObject {
    func showBookDetail(_ book : DetailPresentation)

}
// Bu protokollere input protokol deniyormus
// View in ViewModele Soyledikleri
// DetailViewModelInputProtocol
protocol DetailViewModelProtocol {
    func didLoad()
    var delegate : DetailViewModelDelegate? { get set }
}
