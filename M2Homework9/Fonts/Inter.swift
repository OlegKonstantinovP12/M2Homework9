//
//  Inter.swift
//  M2Homework9
//
//  Created by Oleg Konstantinov on 26.11.2025.
//

import UIKit

enum InterType: String {
    case regular = "Inter-Regular"
    case extraBold = "Inter-ExtraBold"
}


extension UIFont {
    static func interType(size: CGFloat, weight: InterType) -> UIFont {
        .init(name: weight.rawValue, size: size) ?? .systemFont(ofSize: 16, weight: .regular)
        }}

