//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-10.
//

import Foundation

func getTerminalSize() -> (width: UInt16, height: UInt16) {
    getTerminalSizeTput()
}

/// From SO: https://stackoverflow.com/a/47777085/1311272
import Darwin
func getTerminalSizeIoctl() -> (width: UInt16, height: UInt16) {
    var w = winsize()
    guard ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0 else {
        fatalError("failed to read window size")
    }
    return (
        width: w.ws_col,
        height: w.ws_row
    )
}


import ShellOut

func getTerminalSizeTput() -> (width: UInt16, height: UInt16) {
    do {
        let width = try getTerminalWindow(dimension: .width)
        let height = try getTerminalWindow(dimension: .height)
        return (width: width, height: height)
    } catch {
        fatalError("shellout failed, error: \(error)")
    }
}

private enum Dimension {
    case width, height
}

private func getTerminalWindow(dimension: Dimension) throws -> UInt16 {
    let cmd: Tput = (dimension == .width) ? .getScreenWidth : .getScreenHeight
    let string = try tput(command: cmd)
    guard let int = UInt16(string) else {
        throw ParseError.failedToParseIntFromString(string)
    }
    return int
}

public enum ParseError: Swift.Error, Equatable {
    case failedToParseIntFromString(String)
}
