//
//  Metadata.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import Foundation

enum Metadata: Codable, Equatable {
  case string(String)
  case int(Int)
  case double(Double)
  case bool(Bool)
  case object([String: Metadata])
  case array([Metadata])
  case null
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let value = try? container.decode(String.self) {
      self = .string(value)
    } else if let value = try? container.decode(Int.self) {
      self = .int(value)
    } else if let value = try? container.decode(Double.self) {
      self = .double(value)
    } else if let value = try? container.decode(Bool.self) {
      self = .bool(value)
    } else if let value = try? container.decode([String: Metadata].self) {
      self = .object(value)
    } else if let value = try? container.decode([Metadata].self) {
      self = .array(value)
    } else if container.decodeNil() {
      self = .null
    } else {
      throw DecodingError.dataCorrupted(DecodingError.Context(
        codingPath: decoder.codingPath,
        debugDescription: "Invalid JSON"))
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .string(let string):
      try container.encode(string)
    case .int(let int):
      try container.encode(int)
    case .double(let double):
      try container.encode(double)
    case .bool(let bool):
      try container.encode(bool)
    case .object(let object):
      try container.encode(object)
    case .array(let array):
      try container.encode(array)
    case .null:
      try container.encodeNil()
    }
  }
  
  var stringValue: String? {
    switch self {
    case .string(let string):
      return string
    default:
      return nil
    }
  }
  
  var intValue: Int? {
    switch self {
    case .int(let int):
      return int
    default:
      return nil
    }
  }
  
  var doubleValue: Double? {
    switch self {
    case .double(let double):
      return double
    default:
      return nil
    }
  }
  
  var boolValue: Bool? {
    switch self {
    case .bool(let bool):
      return bool
    default:
      return nil
    }
  }
  
  var array: [Metadata]? {
    switch self {
    case .array(let array):
      return array
    default:
      return nil
    }
  }
  
  var object: [String : Metadata]? {
    switch self {
    case .object(let object):
      return object
    default:
      return nil
    }
  }
}
