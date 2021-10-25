//
//  MainInteractor.swift
//  Tekrar_VIPER
//
//  Created by Ali Kose on 20.10.2021.
//

import Foundation

class MainInteractor : NSObject, MainInteractorProtocol {
    
    private let  service : ClientNetworkServiceProtocol!
    private var books : [Result] = []
    
    weak var delegate: MainInteractorDelegate?
    
    init(service : ClientNetworkServiceProtocol){
        self.service = service
    }
    
    func didLoad() {
        service.books { [weak self] books, error in
            
            guard let self = self else {return} // Hoca da yok neten
            guard let results = books?.feed.results else { return print("Servis Veri gelmedi")}
            
            self.books = results
            self.delegate?.handleOutput(.showBooks(results))
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let book = books[indexPath.row]
        // Router baglanti olmadigi icin presenter a veriyi gonderip router a presenter veriyi soyleyecek
        self.delegate?.handleOutput(.showBookDetail(book))
        print("Veriyi alinca secilen result gondercem duzeneleme kismi presenter da")
    }
    
    
}
