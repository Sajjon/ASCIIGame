//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-09.
//

import Foundation
import AppKit

public protocol UserInterfaceProtocol {
    static func show<V>(view: V) where V: NSView
}

public enum UserInterface: UserInterfaceProtocol {}
