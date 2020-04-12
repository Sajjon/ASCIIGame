//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-11.
//

import Foundation

/// Wrapper for the unix command `tput` (in your favourute Terminal, type: `man tput`)
///
/// From `man tput`:
///
///     The 'tput' utility uses the 'terminfo' database to make the
///     values of terminal-dependent capabilities and information
///     available to the shell (see 'sh(1)'), to initialize or reset
///     the terminal, or return the long name of the requested terminal type.
///
/// These commands can be called from a Swift program using e.g. [ShellOut][shellOut]
///
/// [shellOut]: https://github.com/JohnSundell/ShellOut
///
public enum Tput {
    case getScreenWidth
    case getScreenHeight
    case clearScreen
    case moveCursorTo(row: UInt, column: UInt)
    
    case textStyle(TextStyle)
    
    indirect case chain([Tput])
}

public extension Tput {
    enum TextStyle: String {
        case bold

        // https://stackoverflow.com/a/2924755/1311272
        case normal = "sgr0"
    }
}

public extension Tput {
    var command: String {
        [Self.name, argument].joined(separator: " ")
    }
}


private extension Tput {
    static let name: String = "tput"
}

private extension Tput {
    
    var argument: String {
        func fromArgument(_ argument: Argument) -> String {
            argument.rawValue
        }
        switch self {
        case .getScreenWidth: return fromArgument(.getScreenWidth)
        case .getScreenHeight: return fromArgument(.getScreenHeight)
        case .clearScreen: return fromArgument(.clearScreen)
            
        case .moveCursorTo(let row, let column):
            return [
                fromArgument(.moveCursorTo),
                "\(row)",
                "\(column)"
            ].joined(separator: " ")
            
        case .textStyle(let textStyle):
            return textStyle.rawValue
            
        case .chain(let commands):
            let body = commands.map {
                "> \($0.command)"
            }.joined(separator: "\n")
            
            return [
                "-S <<!",
                body,
                "> !"
            ].joined(separator: "\n")
        }
    }

}


private extension Tput {
    enum Argument: String {
        case getScreenWidth     = "cols"
        case getScreenHeight    = "lines"
        case clearScreen        = "clear"
        case moveCursorTo       = "cup"
    }
}
