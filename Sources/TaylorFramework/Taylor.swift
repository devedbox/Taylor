//
//  Taylor.swift
//  TaylorFramework
//
//  Created by devedbox on 2018/10/13.
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

import Foundation
import Files

public struct Checkout {
  public let name: String
  public let folder: Folder
}

public final class Taylor {
  public struct Release {
    public let version: String
    public let file: File
  }
  public let folder: Folder
  
  public init() throws {
    self.folder = try FileSystem().createFolderIfNeeded(at: "/usr/local/Taylor/")
  }
}

extension Taylor {
  public var checkouts: [Checkout] {
    return folder.subfolders.map {
      Checkout(name: $0.name, folder: $0)
    }
  }
  
  public func contains(_ taylor: String) -> Bool {
    return folder.containsSubfolder(named: taylor)
  }
}
