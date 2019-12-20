import Foundation
import Glibc

struct Colony: CustomStringConvertible {

  var colony: Array2DB

  init(colonySize: Int) {
    colony = Array2DB(rows: colonySize, cols: colonySize)
  }

  mutating func setCellAlive(row: Int, col: Int) {
    colony[row,col] = 1
  }

  mutating func setCellDead(row: Int, col: Int) {
    colony[row,col] = 0
  }

  mutating func resetColony() {
    for i in 0..<colony.rows {
      for c in 0..<colony.cols {
        colony[i,c] = 0
      }
    }
  }

  var description: String {
    var d = ""
    for i in 0..<colony.rows {
        for c in 0..<colony.cols {
            if colony[i,c] == 1 {
              d += "*"
            }
            else {
              d += "."
            }
        }
        d += "\n"
    }
    return d
  }

  var numberLivingCells: Int {
    var numberAlive = 0
    for i in 0..<colony.rows {
        for c in 0..<colony.cols {
          if colony[i,c] == 1 {
            numberAlive += 0
          }
        }
    }
    return numberAlive
  }

  func isCellAlive( row: Int, col: Int) -> Bool {
    if colony[row,col] == 1 {
      return true
    }
    else {
      return false
    }
  }

  func numberCellsSurround (row: Int, col: Int) -> Int {
    var numSurround = 0
    if isCellAlive(row: row-1, col: col) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col) == true {
      numSurround += 1
    }
    if isCellAlive(row: row, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row-1, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row-1, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col+1) == true {
      numSurround += 1
    }
    return numSurround
  }

  func numberCellsSurroundWrap (row: Int, col: Int) -> Int {
    var numSurround = 0
    if isCellAlive(row: row-1, col: col) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col) == true {
      numSurround += 1
    }
    if isCellAlive(row: row, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row-1, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row-1, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col-1) == true {
      numSurround += 1
    }
    if isCellAlive(row: row+1, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: colony.rows, col: col) == true {
      numSurround += 1
    }
    if isCellAlive(row: colony.rows, col: col+1) == true {
      numSurround += 1
    }
    if isCellAlive(row: colony.rows, col: col-1) == true {
      numSurround += 1
    }
    //top left corner
    if row == 0 || col == 0 {
      if isCellAlive(row: colony.rows, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: colony.rows, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: colony.cols) == true {
        numSurround += 1
      }
      return numSurround
    }
    //top right corner
    if row == 0 || col == colony.cols {
      if isCellAlive(row: colony.rows, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: colony.rows, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: 0) == true {
        numSurround += 1
      }
      return numSurround
    }
    //bottom right corner
    if row == colony.rows || col == colony.cols {
      if isCellAlive(row: colony.rows, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: colony.cols) == true {
        numSurround += 1
      }
      return numSurround
    }
    //bottom left corner
    if row == colony.rows || col == 0 {
      if isCellAlive(row: 0, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: colony.rows, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: 0) == true {
        numSurround += 1
      }
      return numSurround
    }

    //top row
    if row == 0 {
      if isCellAlive(row: colony.rows, col: col) == true {
        numSurround += 1
      }
      if isCellAlive(row: colony.rows, col: col+1) == true {
        numSurround += 1
      }
      if isCellAlive(row: colony.rows, col: col-1) == true {
        numSurround += 1
      }
      return numSurround
    }
    //bottom row
    if row == colony.rows {
      if isCellAlive(row: 0, col: col) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: col+1) == true {
        numSurround += 1
      }
      if isCellAlive(row: 0, col: col-1) == true {
        numSurround += 1
      }
      return numSurround
    }
    //left column
    if col == 0 {
      if isCellAlive(row: row, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: row-1, col: colony.cols) == true {
        numSurround += 1
      }
      if isCellAlive(row: row+1, col: colony.cols) == true {
        numSurround += 1
      }
      return numSurround
    }
    //right column
    if col == colony.cols {
      if isCellAlive(row: row, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: row+1, col: 0) == true {
        numSurround += 1
      }
      if isCellAlive(row: row-1, col: 0) == true {
        numSurround += 1
      }
      return numSurround
    }
    return numSurround
  }

  mutating func evolve() {
    var newColony: Array2DB = colony
    for i in 0..<colony.rows {
      for c in 0..<colony.cols {
        let numsurround2 = numberCellsSurround(row: i, col: c)
        if numsurround2 < 2 {
          newColony[i,c] = 0
        }
        if numsurround2 > 3 {
          newColony[i,c] = 0
        }
        if numsurround2 == 3 {
          newColony[i,c] = 1
        }
      }
    }
    colony = newColony
  }
  mutating func wrapEvolve() {
    var newColony: Array2DB = colony
    for i in 0..<colony.rows {
      for c in 0..<colony.cols {
        let numsurround2 = numberCellsSurroundWrap(row: i, col: c)
        if numsurround2 < 2 {
          newColony[i,c] = 0
        }
        if numsurround2 > 3 {
          newColony[i,c] = 0
        }
        if numsurround2 == 3 {
          newColony[i,c] = 1
        }
      }
  }
  colony = newColony
  }
}
