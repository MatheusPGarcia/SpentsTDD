//
//  Spent.swift
//  SpentsTDD
//
//  Created by Matheus Garcia on 28/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

class Spent: Equatable {

    var name: String
    var value: Double
    var description: String?

    init (_ name: String, _ value: Double, _ description: String? = nil) {
        self.name = name
        self.value = value
        self.description = description
    }

    func edit (_ newName: String? = nil, _ newValue: Double? = nil, _ newDescription: String? = nil) {

        if let name = newName {
            self.name = name
        }

        if let value = newValue {
            self.value = value
        }

        if let description = newDescription {
            self.description = description
        } else if self.description != nil {
            self.description = nil
        }
    }
}

func == (lhs: Spent, rhs: Spent) -> Bool {

    if lhs.name == rhs.name, lhs.value == rhs.value, lhs.description == rhs.description {
        return true
    }

    return false
}
