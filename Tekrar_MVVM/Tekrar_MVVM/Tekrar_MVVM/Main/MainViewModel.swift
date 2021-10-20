//
//  MainViewModel.swift
//  Tekrar_MVVM
//
//  Created by Ali Kose on 20.10.2021.
//

import Foundation
// Import UIKitlik hicbir sey olmasin.

class MainViewModel : NSObject , MainViewModelProtocol {
    // closure dan dolayi retain cycle olmasin diye weak ler geliyor
    /*
     [weak self]
     guard let self = self else{return} kullanimina bakmaliyim.
     */
    weak var delegate: MainViewModelDelegate?
    var service : ClientNetworkService!
    /*
     Hoca Servisi
     init(service : ClientNetworkService){
            self.service = service
     } ile constructor injection ile aldi
     */
   private var books : [Result] = []

    
    // Viewdan herhangi bir islem gelince viewmodel de logicini yap
    func didLoad() {
        service.books { [weak self] books, errors in
            guard let self = self else {return}
            guard let result = books?.feed.results else {return print("Veri Bos Geldi")}
            let book = result.map(MainPresentation.init)
            self.books = result
            self.delegate?.handleOutput(.showBooks(book))
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let book = books[indexPath.row]
        // Ben simdi burada rootlayamiyorum :D
        self.delegate?.navigate(to: .showDetail(book))
    }
    
    
}
