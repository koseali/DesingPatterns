//
//  MainViewModel.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

// 
protocol MainViewDelegate: NSObject {
    func didSelectRow(indexPath: IndexPath)
}

// View a ViewControllerdan ne emredecegiz ?
protocol MainViewProtocol: NSObject {
    func showBooks(_ books: [MainPresentation])
}
