//
//  ReuseIdentifierProviding.swift
//  TwitchCoreUI
//
//  Created by Lily Ballard on 7/31/19.
//  Copyright © 2019 Twitch Interactive, Inc.
//

import Foundation

/// A protocol for objects that provide a standard reuse identifier.
///
/// This is meant to be used with classes that implement object reuse, such as `UITableView` and
/// `UICollectionView`.
public protocol ReuseIdentifierProviding {
    /// A string usable as a reuse identifier.
    ///
    /// The default implementation for classes returns a string representation of the class.
    static var standardReuseIdentifier: String { get }
}

extension ReuseIdentifierProviding where Self: AnyObject {
    public static var standardReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
