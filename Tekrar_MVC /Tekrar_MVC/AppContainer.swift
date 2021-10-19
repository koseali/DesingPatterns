//
//  AppContainer.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
var appContainer = AppContainer()

class AppContainer {
    var router = AppRouter()
    var service = ClientNetworkService()
}
