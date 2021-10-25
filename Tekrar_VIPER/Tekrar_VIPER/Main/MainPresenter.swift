//
//  MainPresenter.swift
//  Tekrar_VIPER
//
//  Created by Ali Kose on 20.10.2021.
//

import Foundation
// Dummy sekilde kendine geleni iletmesi lazim

class MainPresenter : NSObject, MainPresenterProtocol {
    
    
    let interactor : MainInteractorProtocol!
    unowned let mainView : MainViewProtocol!
    let router : MainViewRouterProtocol!
    
    private var books : [MainPresenter] = []
    
    init(interactor : MainInteractorProtocol , view : MainViewProtocol , router : MainViewRouterProtocol){
        self.interactor = interactor
        self.mainView  = view
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.didLoad()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        interactor.didSelectRow(at: indexPath)
    }
}

extension MainPresenter :  MainInteractorDelegate {
    
    func handleOutput(_ output: MainInteractorOutput) {
        switch output {
        case .showBooks(let books):
            mainView.handleOutput(.showBooks(books.map(MainPresentation.init)))
            
        case .showBookDetail(let book):
            router.navigate(to: .showBookDetail(book))
        }
    }
}
