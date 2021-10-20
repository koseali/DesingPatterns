//
//  DetailBuilder.swift
//  TodoAppExample
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
import UIKit

class DetailBuilder{
    static func build() -> DetailViewController{
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        view.localNotificationManager = appContainer.coredataManager falan diyerek vericem
//        Bu buiilderi kullanirken oncesinde ama  aslinda boyle 
        return view
    }
}

/*
 Ben veriyi extensionla gectigim icin aslinda burda build ile gecicem cunku mainden gecerken navigate funk. da cagirilicam
 static func build(with movie: Result) -> MovieDetailViewController {
     let viewController = MovieDetailViewController()
     viewController.viewModel = MovieDetailViewModel(movie: movie)
     return viewController
 }
 */
