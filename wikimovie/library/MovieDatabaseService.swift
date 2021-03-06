//
//  MovieDatabaseService.swift
//  wikimovie
//
//  Created by Salim Wijaya on 25/07/21.
//

import Foundation
import CoreData
protocol IMovieDatabaseService {
    func fetchMovieAtPage(_ page: Int) -> [Movie]
}

class MovieDatabaseService: IMovieDatabaseService  {
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func fetchMovieAtPage(_ page: Int) -> [Movie] {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = Movie.fetchMovieRequest()
        fetchRequest.fetchLimit = 20
        fetchRequest.fetchOffset = (page - 1) * 20
        
        do {
            let movie = try managedObjectContext.fetch(fetchRequest)
            return movie
        } catch let error {
            print(error)
            return []
        }
    }
    
    
}
