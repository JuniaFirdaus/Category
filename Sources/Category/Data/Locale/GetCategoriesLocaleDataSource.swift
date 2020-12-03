//
//  File.swift
//  
//
//  Created by PT Lintas Media Danawa on 03/12/20.
//

import Foundation
import Core
import Combine
import RealmSwift
import Foundation

// 1
public struct GetCategoriesLocaleDataSource: LocaleDataSource {
  
  // 2
  public typealias Request = Any
  public typealias Response = CategoryModuleEntity
  
  private let _realm: Realm
  
  public init(realm: Realm) {
    _realm = realm
  }
  
  // 3
  public func list(request: Any?) -> AnyPublisher<[CategoryModuleEntity], Error> {
    return Future<[CategoryModuleEntity], Error> { completion in
      let categories: Results<CategoryModuleEntity> = {
        self._realm.objects(CategoryModuleEntity.self)
          .sorted(byKeyPath: "title", ascending: true)
      }()
      completion(.success(categories.toArray(ofType: CategoryModuleEntity.self)))
      
    }.eraseToAnyPublisher()
  }
  
  // 4
  public func add(entities: [CategoryModuleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try self._realm.write {
          for category in entities {
            self._realm.add(category, update: .all)
          }
          completion(.success(true))
        }
      } catch {
        completion(.failure(DatabaseError.requestFailed))
      }
      
    }.eraseToAnyPublisher()
  }
  
  // 5
  public func get(id: String) -> AnyPublisher<CategoryModuleEntity, Error> {
    fatalError()
  }
  
  // 6
  public func update(id: Int, entity: CategoryModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
}
