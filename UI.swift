import Foundation
import Glibc

struct UI {

  var colonySize: Int
  var rows: Int
  var cols: Int
  var colony = Colony(colonySize: 10)

  func splitParts(_ expression: String)->[String]{
    return expression.split{$0 == " "}.map{String($0)}
  }

  func splitLines(_ expression: String)->[String]{
    return expression.split{$0 == "\n"}.map{String($0)}
  }

  init(size: Int) {
    print("Welcome to Conway's Game of Life!")
    print("Colony size...", terminator: "")
    var size = Int(readLine()!)
    self.colonySize = 0
    self.rows = 0
    self.cols = 0
  }
  mutating func create(){
      print("\nEnter x y coordinates of living cells, blank line when done")
      repeat{
          let coor = readLine()!
          if coor == ""{break}
          let test: [String] = splitParts(coor)
          colony.colony[Int(test[0])!, Int(test[1])!] = 1
      }while true
      print("Running evolution...")

      var generation = 1
      repeat{
          print("Enter an Int, evolve that number generation or type q to quit", terminator: "")
          let num = Int(readLine()!)
          if num != nil{
              for _ in 0..<num!{
                  print("Generation #", generation)
                  generation += 1
                  colony.evolve()
                  print(colony)
              }
          }
          /*else{
              print("Generation #", generation)
              generation += 1
              print(colony)
          }*/

      } while
          readLine()! != "q"
  }

  mutating func run(){
      create()
  }
}
