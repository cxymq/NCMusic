//
//  NCStringExtension.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/13.
//

import Foundation
import UIKit

extension String {
    func imageUrlAddParams(width: CGFloat, height: CGFloat) -> String {
        let scale: CGFloat = UIScreen.main.scale
        let param = "param=" + String(format: "%.f", width * scale) + "y" + String(format: "%.f", height * scale);
        return self.appending("?").appending(param)
    }
}
