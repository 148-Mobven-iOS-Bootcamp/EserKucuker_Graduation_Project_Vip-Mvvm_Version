//
//  CoreDataManager.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation
import CoreData

class CoreDataManager : DataManagerProtocol {
    
    static let shared = CoreDataManager()
    init() {}
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "To_Do")
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
    
    let manageContext = shared.persistentContainer.viewContext
    
    func updateData(todoItem: Tasks, title: String, detail: String, date: Date?) {
        todoItem.title = title
        todoItem.detail = detail
        todoItem.endDate = date
        todoItem.createdDate = Date()
        
        do {
            if manageContext.hasChanges{
                try manageContext.save()
                print("Tasks Başarıyla güncellendi")
            }
        } catch  {
            print("Guncelleme Basarisiz oldu")
            debugPrint("Guncelleme hatasi: \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        <#code#>
    }
    
    func fetchData() -> [Tasks] {
        let request = NSFetchRequest<Tasks>(entityName: "Tasks")
        //let manageContext = persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        
//        do {
//            let result = try manageContext.fetch(request)
//            print("Tasks alındı")
//            return result
//
//        } catch {
//            debugPrint("Veri Cekme hatasi: \(error.localizedDescription)")
//        }
        return fetch(message: "Tasks alındı", with: "Veri Cekme hatasi", request: request)
        return []
    }
    
    func deleteData(todoItem: Tasks) {
        //let manageContext = persistentContainer.viewContext
        manageContext.delete(todoItem)
        save(message: "Başarıyla veriler silindi", with: "Silme hatasi")
    }
    
    func sortbyCreatedData() -> [Tasks] {
        // let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Tasks>(entityName: "Tasks")
        let sorter = NSSortDescriptor(key: "createdDate", ascending: false)
        request.sortDescriptors = [sorter]
        request.returnsObjectsAsFaults = false
//        do {
//            let result = try manageContext.fetch(request)
//            print("Result : \(result)")
//            return result
//
//        } catch {
//            debugPrint("Siralama hatasi: \(error.localizedDescription)")
//        }
        return fetch(message: "Sıralama Başarılı", with: "Siralama hatasi", request: request)
        return []
        
    }
    
    func searchData(with: String) -> [Tasks] {
        // let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Tasks>(entityName: "Tasks")
        request.predicate = NSPredicate(format: "title contains[c] '\(with)'")
        return fetch(message: "", with: "Arama Hatası", request: request)
        return []
    }
    
    func save(message: String, with: String){
        do {
            try  manageContext.save()
            print(message)
        } catch  {
            debugPrint( with + ": \(error.localizedDescription)")
        }
    }
    
    func fetch(message: String?, with: String, request : NSFetchRequest<Tasks>)-> [Tasks]{
        do {
            let data = try manageContext.fetch(request)
            return data
        } catch  {
            debugPrint( with + ": \(error.localizedDescription)")
        }
    }
}
