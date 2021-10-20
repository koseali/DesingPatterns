//
//  CoreDataManager.swift
//  TodoAppExample
//
//  Created by Ali Kose on 8.10.2021.
//

import Foundation
import CoreData

protocol DataManagerProtocol {
    func saveData( title : String, subtitle : String, date : String,completion: ((Bool) ->()))
    
}

class CoreDataManager : DataManagerProtocol {
    open var duzenlendiMi : Bool = false
    
    /* ben kapadim
     
     func sceneDidEnterBackground(_ scene: UIScene) {
     // Called as the scene transitions from the foreground to the background.
     // Use this method to save data, release shared resources, and store enough scene-specific state information
     // to restore the scene back to its current state.
     
     // Save changes in the application's managed object context when the application transitions to the background.
     saveContext()
     //         Save Context
     //        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
     }
     */
    
    // MARK: - Core Data stack
    // Sadece Scne Delegate icin shared Kullaniliyor.
    // static let shared = CoreDataManager()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoAppExample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func saveData( title : String, subtitle : String, date : String,completion: ((Bool) ->()))   {
        let manageContext = persistentContainer.viewContext
        let model = TodoTasks(context: manageContext )
        model.title = title
        model.detailTitle = subtitle
        model.date = date
        model.createdDate = Date()
        do {
            if manageContext.hasChanges{
                try  manageContext.save()
                print("Basariyla kaydedildi.")
                completion(true)
            }
         
        } catch  {
            debugPrint("Kaydetme hatasi: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    //    Object olarak mi alicaz acaba bakilir
    func DeleteData(data : TodoTasks)   {
        let manageContext = persistentContainer.viewContext
        manageContext.delete(data)
        do {
            try  manageContext.save()
            print("Basariyla Silindi.")
        } catch  {
            debugPrint("Silme hatasi: \(error.localizedDescription)")
        }
    }
    
    func fetchData() -> [TodoTasks] {
        let request = NSFetchRequest<TodoTasks>(entityName: "TodoTasks")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        let manageContext = persistentContainer.viewContext
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try manageContext.fetch(request)
            print("Resul icinde ne var \(result)")
            return result
            
        } catch {
            print("Failed")
        }
        return []
    }
    
    //     TODO UPDATE DATA
    func updateData() {
        let manageContext = persistentContainer.viewContext
        
        do {
            if manageContext.hasChanges{
                try manageContext.save()
                print("Core Data ici veri guncellendi.")
            }
        } catch  {
            print("Basarisiz Guncelleme oldu")
            print(error)
        }
    }
    
    func sortbyCreatedData() -> [TodoTasks]{
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<TodoTasks>(entityName: "TodoTasks")
        let sorter = NSSortDescriptor(key: "createdDate", ascending: false)
        request.sortDescriptors = [sorter]
        request.returnsObjectsAsFaults = false
        do {
            let result = try manageContext.fetch(request)
            print("Result icinde ne var \(result)")
            return result
            
        } catch {
            print("Failed")
        }
        return []
    }
    
    func searchData(with : String) -> [TodoTasks]{
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<TodoTasks>(entityName: "TodoTasks")
        request.predicate = NSPredicate(format: "title contains[c] '\(with)'")
        
        do {
           let data = try manageContext.fetch(request) 
            return data
        } catch let error as NSError {
            print("Could not fetch. \(error)")
        }
        return []
    }
}
