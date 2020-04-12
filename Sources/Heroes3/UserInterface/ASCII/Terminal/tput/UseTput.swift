//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-12.
//

import Foundation
import ShellOut

func tput(command tputCommand: Tput) throws -> String {
    try shellOut(
        to: [tputCommand.command]
    )
}
