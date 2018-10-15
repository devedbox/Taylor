//
//  Source.swift
//  TaylorFramework
//
//  Created by devedbox on 2018/10/15.
//

import Foundation
import Files

/// A type represents a git source of `Taylor`.
public struct Source {
  /// The type represents the spec of the source.
  public struct Spec {
    /// The url of the source.
    public let url: String
    /// The host name of the source.
    public let host: String
  }
  /// The location of the source locate at.
  public let location: Folder
  /// The spec of the source.
  public let spec: Spec
  /// The git repository hosted on the source.
  public let repos: [GitRepository]
}
