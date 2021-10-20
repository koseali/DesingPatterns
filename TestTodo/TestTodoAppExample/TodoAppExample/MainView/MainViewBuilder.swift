//
//  MainViewBuilder.swift
//  TodoAppExample
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
import UIKit

class MainViewBuilder{
//    Buildi static fonk yapinca class objesi olusturmadan ustunden cagirabilirim
   static func build() -> MainViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
       view.dataManager = appContainer.coredataManager
// Burada artik viper ya da ViewModel olsun
//        view.viewmodel = MainViewModel(service : appContainer.coredata) falan diye olusturucaz.
//        Bu sekilde disardan inject etmis oluyoruz bunu da rootda olustururken kullaniyoruz.
         return view
    }
}
