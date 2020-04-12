import Foundation

let size = getTerminalSize()
let height = Int(size.height)
let width = Int(size.width)

let horizontalHalf = String(repeating: "*", count: (width/2 - 5))

let foo = String(repeating: "~", count: width)
let verticalPadding = (0...((height / 2) - 1)).map { _ in
    foo
}.joined(separator: "\n")

func fillScreenWith(message: String) {
    print(verticalPadding)
    print(horizontalHalf + " " + message + " " + horizontalHalf)
    print(verticalPadding)
}

func fillScreenWith(number: Int) {
    fillScreenWith(message: "\(number)")
}

for i in 0..<10 {
    fillScreenWith(number: i)
    Thread.sleep(forTimeInterval: 0.1)
    clearScreen()
}
