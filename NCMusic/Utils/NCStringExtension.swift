//
//  NCStringExtension.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/13.
//

import Foundation
import UIKit

extension String {
    func imageUrlAddParams(width: Int, height: Int) -> String {
        let param = "param=" + String(width) + "y" + String(height);
        return self.appending("?").appending(param)
    }
}
