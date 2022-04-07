//
//  RealmDatabase.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation
import RealmSwift

class RealmDatabase {
    static let shared: RealmDatabase = RealmDatabase()
    var notificationToken: NotificationToken?
    
    private init() { }
    
    deinit {
        notificationToken?.invalidate()
    }
}

extension RealmDatabase: CartDB {
    
    func updateCart(using cartItem: CartItem) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(RealmCartItem(cartItem: cartItem), update: .all)
            }
        } catch {
            debugPrint("Database Error===\(error)")
            return false
        }
        return true
    }
    
    func deleteCart(using skuId: String) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                if let realmObject = realm.objects(RealmCartItem.self).first(where: { $0.skuid == skuId }) {
                    realm.delete(realmObject)
                }
            }
        } catch {
            debugPrint("Database Error===\(error)")
            return false
        }
        return true
    }

    func getCount(closure: @escaping CartCountClosure) {
        do {
            let realm = try Realm()
            let results = realm.objects(RealmCartItem.self)
            notificationToken = results.observe({ _ in
                closure(results.count)
            })
        } catch {
            debugPrint("Database Error===\(error)")
        }
    }
    
    func getCartItem(using skuId: String) -> CartItem {
        let realm = try! Realm()
        guard let realmObject = realm.objects(RealmCartItem.self).first(where: { $0.skuid == skuId }) else {
            return CartItem(skuid: skuId, value: 0)
        }
        return CartItem(realmCartItem: realmObject)
    }
}
