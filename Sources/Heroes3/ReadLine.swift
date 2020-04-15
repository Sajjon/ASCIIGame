//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-10.
//

import Foundation

extension String {
    var isYes: Bool {
        if compare("y", options: .caseInsensitive) == .orderedSame {
            return true
        }
        if compare("yes", options: .caseInsensitive) == .orderedSame {
            return true
        }
        return false
    }
}


//print("This game only works if terminal is in full screen, is it in full screen?")
//var answer: String?
//repeat {
//    answer = readLine(strippingNewline: true)
//} while !(answer?.isYes == true)
