//
//  AppContainer.swift
//  TodoAppExample
//
//  Created by Ali Kose on 18.10.2021.
//

import Foundation
// TODO: Burada surekli kullanilan uygulama boyunca yasayacak seyler olucak
// - CoreDataManager - NotificationManager
// Initlerle viewmodeller olusucak

let appContainer = AppContainer()

class AppContainer {
    var router = AppRouter()
    var coredataManager = CoreDataManager()
    var pushNotificationManager = LocalNotificationManager()
}
