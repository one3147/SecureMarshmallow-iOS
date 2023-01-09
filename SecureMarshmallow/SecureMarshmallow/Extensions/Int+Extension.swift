//
//  Int+Extension.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/01/09.
//

import Foundation
import UIKit

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
