//
//  MainViewModel.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

// MARK: VIEW

protocol MainViewProtocol : NSObject {
    func handleOutput(_ output: MainPresenterOutput)
}


// MARK: INTERACTOR

protocol MainInteractorProtocol : NSObject {
    
    var delegate : MainInteractorDelegate? { get set }
    func didLoad()
    func didSelectRow(at indexPath : IndexPath)
    // func didAddTapped
}

protocol MainInteractorDelegate : NSObject{
    func handleOutput( _ output : MainInteractorOutput )
}

enum MainInteractorOutput {
    
    case showBooks([Result])
    case showBookDetail(Result)
    // case showAdd()
}


// MARK: PRESENTER
protocol MainPresenterProtocol : NSObject {
    func viewDidLoad()
    func didSelectRow(at indexPath : IndexPath)
}

// MVVM View modelde burada delegate yani output olarak route islemi vardi artik yok
enum MainPresenterOutput {
    case showBooks([MainPresentation])
}


// MARK: ROUTER
protocol MainViewRouterProtocol  : NSObject {
    func navigate(to route: MainViewRoute)
}

enum MainViewRoute {
    case showBookDetail(Result)
}

// 1  Interactor Ana islemler
// 2  Presenter Herye gonderen  bundan
// 3  View
// 4  builder
// 5  Router
