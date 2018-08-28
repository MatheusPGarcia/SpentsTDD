//
//  UserSpents.swift
//  SpentsTDD
//
//  Created by Matheus Garcia on 28/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

enum UserSpentsErrors: Error {
    case indexOutOfRange
}

class UserSpents {

    var spents: [SpentObj]

    init() {
        spents = []
    }

    func numberOfSpents() -> Int {

        let spentsCount = spents.count
        return spentsCount
    }

    func addSpent(_ spent: SpentObj) {
        spents.append(spent)
    }

    func removeSpent(atIndex index: Int) throws {

        let arraySize = spents.count

        if arraySize < index {
            throw UserSpentsErrors.indexOutOfRange
        }

        spents.remove(at: index)
    }

    func getSpent(atIndex index: Int) throws -> SpentObj {

        let arraySize = spents.count

        if arraySize < index {
            throw UserSpentsErrors.indexOutOfRange
        }

        let wantedSpent = spents[index]
        return wantedSpent
    }
}
