//
//  List.swift
//  taylor
//
//  Created by devedbox on 2018/10/13.
//
//  Copyright (c) 2018 devedbox
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import TaylorFramework
import Commander

public struct List: CommandRepresentable {
  public struct Options: OptionsRepresentable {
    public enum CodingKeys: String, CodingKeysRepresentable {
      case isAll = "all"
    }
    
    public static var keys: [Options.CodingKeys : Character] = [
      .isAll: "A"
    ]
    
    public static var descriptions: [Options.CodingKeys : OptionDescription] = [
      .isAll: .default(value: false, usage: "List all the install taylors' info")
    ]
    
    public let isAll: Bool
  }
  
  public static let symbol: String = "list"
  public static let usage: String = "List and print infos of installed taylor info."
  
  public static func main(_ options: List.Options) throws {
    let taylor = try Taylor()
    print(taylor.checkouts.map { $0.name }.joined(separator: "\n"))
  }
}
