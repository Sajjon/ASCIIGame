//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-10.
//

import Foundation
import ShellOut

func getTerminalSize() -> (width: UInt, height: UInt) {
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

private func getTerminalWindow(dimension: Dimension) throws -> UInt {
    let tputArg: String
    switch dimension {
    case .width: tputArg = "cols" // columns
    case .height: tputArg = "lines" // rows
    }
    let integerAsString = try shellOut(to: "tput", arguments: [tputArg])
    
    guard let dimensionResponse = UInt(integerAsString) else {
        fatalError("Failed to convert to UInt from string: \(integerAsString)")
    }
    return dimensionResponse
}
