//
//  File.swift
//  
//
//  Created by PT Lintas Media Danawa on 03/12/20.
//

import Foundation
import RealmSwift

public class CategoryModuleEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var desc: String = ""
  
  public override static func primaryKey() -> String? {
    return "id"
  }
}
