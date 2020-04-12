//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-10.
//

import Foundation
import Darwin

// From SO: https://stackoverflow.com/a/47777085/1311272
func getTerminalSize() -> (width: UInt16, height: UInt16) {
    var w = winsize()
    guard ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0 else {
        fatalError("failed to read window size")
    }
    return (
        width: w.ws_col,
        height: w.ws_row
    )
}
