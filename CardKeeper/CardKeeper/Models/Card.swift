//
//  Card.swift
//  CardKeeper
//
//  Created by Nata Boiko on 24.05.2021.
//

import Foundation
import UIKit
import RealmSwift

class Card: Object {
    @objc dynamic var bankLogo: Data?
    @objc dynamic var number: String?
    @objc dynamic var color: String?
    @objc dynamic var dateCreated: Date?
}
