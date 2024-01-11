//
//  RealmManager.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/11/24.
//

import Foundation
import RealmSwift

protocol BakkwojwoRealm {
    func read<T: Object>(_ object: T.Type) -> Results<T>
    func write<T: Object>(_ object: T)
    func update<T: Object>(_ object:T, completion: @escaping ((T)->()))
    func delete<T: Object>(_ object: T)
}

final class RealmManager: BakkwojwoRealm {

    static let shared = RealmManager()
    
    private let realmInstance: Realm
    
    private init() {
        self.realmInstance = try! Realm()
    }
    
    func getLocalRealmURL() {
        print("Realm URL:", realmInstance.configuration.fileURL!)
    }
    
    func read<T: Object>(_ object: T.Type) -> Results<T> {
        return realmInstance.objects(object)
    }
    
    func update<T>(_ object: T, completion: @escaping ((T) -> ())) {
        do {
            try realmInstance.write {
                completion(object)
            }
        } catch let error {
            print(error)
        }
    }
    
    func write<T: Object>(_ object: T) {
        do {
            try realmInstance.write {
                realmInstance.add(object)
            }
        } catch let error {
            print(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realmInstance.write {
                realmInstance.delete(object)
            }
        } catch let error {
            print(error)
        }
    }
    
    
}
