//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-10.
//

import Foundation

/// Comprehensive guide: http://www.termsys.demon.co.uk/vtansi.htm
enum OutputCommand {
    
    /// this does not seem to place cursor "home", so you might wanna call `cursorHome()`
    case eraseScreen
    case eraseLine
    
    case cursorHome
}

extension OutputCommand {
    var code: String {
        switch self {
            
        case .eraseScreen:
            return "2J"
            
        case .eraseLine:
            return "K"
            
        case .cursorHome:
            return "H"

        }
    }
}

extension OutputCommand {
    static let escape = "\u{1B}[1A\u{1B}"
    static let prefix = "["
}

extension OutputCommand: CustomStringConvertible {
    var output: String {
        Self.escape + Self.prefix + code
    }
    
    var description: String {
        output
    }
}

func output(command: OutputCommand) {
    print(command)
}


// MARK: Common
func eraseScreen() {
    // "Bug"? calling just "eraseScreen" does not work, but doing cursor home fixes it.
    output(command: .eraseScreen)
    output(command: .cursorHome)
}

