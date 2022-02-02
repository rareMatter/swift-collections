//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Collections open source project
//
// Copyright (c) 2021-2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

extension Collection {
  @inlinable
  @inline(__always)
  internal func _rebased<Element>() -> UnsafeBufferPointer<Element>
  where Self == UnsafeBufferPointer<Element>.SubSequence {
    .init(rebasing: self)
  }
}

extension UnsafeBufferPointer {
  @inlinable
  @inline(__always)
  internal func _ptr(at index: Int) -> UnsafePointer<Element> {
    assert(index >= 0 && index < count)
    return baseAddress.unsafelyUnwrapped + index
  }
}