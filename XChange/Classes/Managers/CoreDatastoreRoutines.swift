//
//  CoreDatastoreRoutines.swift
//  dreams
//
//  Created by Nick Voloshyn on 5/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation
import CoreData

final class CoreDatastoreRoutines {

//    MARK: - Private variables
    
    private var managedObjectModel: NSManagedObjectModel?
    private var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    
    var managedObjectContext: NSManagedObjectContext?

//    MARK: - Instance initialization

//    static let sharedInstance : CoreDatastoreRoutines = {
//        let instance = CoreDatastoreRoutines()
//        return instance
//    }()
    
    
    init() {
        managedObjectModel = NSManagedObjectModel.mergedModel(from: nil)
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        let applicationDocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).lastObject()
        let storeURL = applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        let failureReason = "There was an error creating or loading the application's saved data."
        do {
            try persistentStoreCoordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
            managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedObjectContext!.persistentStoreCoordinator = persistentStoreCoordinator
            managedObjectContext!.undoManager = nil
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "ERROR_DOMAIN", code: 999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
    }
    
    
//    MARK: - Interface methods
    
    func saveContext () {
        if ((managedObjectContext?.hasChanges) != nil) {
            do {
                try managedObjectContext?.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
    func fetchItem(with predicate: NSPredicate?,
                   entityName: String,
                   sortDescriptors: [NSSortDescriptor]?,
                   completionBlock: (([NSManagedObject]?) -> Void)!) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if (predicate != nil) {
            fetchRequest.predicate = predicate
        }
        fetchRequest.sortDescriptors = sortDescriptors
        managedObjectContext?.perform {
            do {
                let queryResults = try self.managedObjectContext?.fetch(fetchRequest)
                completionBlock(queryResults as? [NSManagedObject])
            } catch let error {
                print(error)
                completionBlock(nil)
            }
        }
    }

    
}
