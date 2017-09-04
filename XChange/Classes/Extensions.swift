//
//  Extensions.swift
//  dreams
//
//  Created by Nick Voloshyn on 6/19/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

extension Array {
    func lastObject() -> Element {
        let endIndex = self.endIndex
        let lastItemIndex = endIndex - 1
        return self[lastItemIndex]
    }
}

extension Float {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
}

class Extensions: NSObject {

}
