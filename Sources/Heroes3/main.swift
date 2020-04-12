import Foundation

//let size = getTerminalSize()
print("Size according to tput : \(getTerminalSizeTput())")
print("Size according to Ioctl : \(getTerminalSizeIoctl())")
//let width = Int(size.width) * 2
//let height = Int(size.height) * 2
//
////enum MapSiz
//
//let horizontalHalf = String(repeating: "*", count: (width/2 - 5))
//
//let foo = String(repeating: "~", count: width)
//let verticalPadding = (0...((height / 2) - 1)).map { _ in
//    foo
//}.joined(separator: "\n")
//
//func fillScreenWith(message: String) {
//    print(verticalPadding)
//    print(horizontalHalf + " " + message + " " + horizontalHalf)
//    print(verticalPadding)
//}
//
//func fillScreenWith(number: Int) {
//    fillScreenWith(message: "\(number)")
//}
//
//for i in 0..<1_000_000 {
//    fillScreenWith(number: i)
//    Thread.sleep(forTimeInterval: 0.01)
//    eraseScreen()
//}
