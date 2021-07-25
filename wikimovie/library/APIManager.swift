//
//  APIManager.swift
//
//  Created by Salim Wijaya
//

import Foundation
import Alamofire
import CoreData

class APIManager {
    
    private var sessionManager: Session = Session.default
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager()
        return apiManager
    }()

    // MARK: - Vars & Lets
    // MARK: - Accessors
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
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
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Function
    func call<T>(type: EndpointItem, handler: @escaping (T?)->()) where T: Codable {
        self.sessionManager.request(type).validate().responseJSON { data in
            
            switch data.result {
                case .success(_):
                    let decoder = JSONDecoder()
                    guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext else {
                                    fatalError("Failed to retrieve managed object context")
                                }
                    let managedObjectContext = self.persistentContainer.viewContext
                    decoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
                    if let jsonData = data.data {
                        print("RESULT",type.path)
                        print(String(decoding: jsonData, as: UTF8.self))
                        do {
                            print(T.self)
                            let result = try decoder.decode(T.self, from: jsonData)
                            print(result)
                            try managedObjectContext.save()
                            handler(result)
                        } catch let err {
                            print("ERRROR ??")
                            print(err)
                        }
                        print("RESULT",type.path)
                    }
                    break
                case .failure(let _error):
                    print(_error)
//                    let decoder = JSONDecoder()
//                    if let jsonData = data.data {
////                        print(String(decoding: jsonData, as: UTF8.self))
////                        let result = try? decoder.decode(E.self, from: jsonData)
////                        handler(nil, result)
//                    }
//                    if let responseCode = _error.responseCode {
//                        if responseCode == 401 {
//
//                        }
//                    }
                    break
            }
        }
    }
}
