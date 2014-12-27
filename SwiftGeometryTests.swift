import UIKit
import XCTest
import SwiftGeometry

class SwiftGeometryTests: XCTestCase {
  func testPointExtensions() {
    let x = CGPoint(x: 10, y: 10)

    XCTAssertEqual(x.withX(4), CGPoint(x: 4, y: 10))
    XCTAssertEqual(x.withY(4), CGPoint(x: 10, y: 4))

    XCTAssertEqual(x.mapX { $0 + 4 }, CGPoint(x: 14, y: 10))
    XCTAssertEqual(x.mapY { $0 + 4 }, CGPoint(x: 10, y: 14))
  }

  func testSizeExtensions() {
    let x = CGSize(width: 10, height: 10)

    XCTAssertEqual(x.withWidth(4), CGSize(width: 4, height: 10))
    XCTAssertEqual(x.withHeight(4), CGSize(width: 10, height: 4))

    XCTAssertEqual(x.mapWidth { $0 + 4 }, CGSize(width: 14, height: 10))
    XCTAssertEqual(x.mapHeight { $0 + 4 }, CGSize(width: 10, height: 14))
  }

  func testRectExtensions() {
    let x = CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 10, height: 10))

    XCTAssertEqual(x.withX(4), CGRect(origin: CGPoint(x: 4, y: 10), size: CGSize(width: 10, height: 10)))
    XCTAssertEqual(x.withY(4), CGRect(origin: CGPoint(x: 10, y: 4), size: CGSize(width: 10, height: 10)))
    XCTAssertEqual(x.withWidth(4), CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 4, height: 10)))
    XCTAssertEqual(x.withHeight(4), CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 10, height: 4)))

    XCTAssertEqual(x.mapX { $0 + 4 }, CGRect(origin: CGPoint(x: 14, y: 10), size: CGSize(width: 10, height: 10)))
    XCTAssertEqual(x.mapY { $0 + 4 }, CGRect(origin: CGPoint(x: 10, y: 14), size: CGSize(width: 10, height: 10)))
    XCTAssertEqual(x.mapWidth { $0 + 4 }, CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 14, height: 10)))
    XCTAssertEqual(x.mapHeight { $0 + 4 }, CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 10, height: 14)))

    let baseRect = CGRect(x: 10, y: 10, width: 150, height: 150)

    let (leftRect, rightRect) = baseRect.splitHorizontally(0.4)
    XCTAssertEqual(leftRect, CGRect(x: 10, y: 10, width: 60, height: 150), "splitHorizontally: left rect incorrect")
    XCTAssertEqual(rightRect, CGRect(x: 70, y: 10, width: 90, height: 150), "splitHorizontally: right rect incorrect")

    let (topRect, bottomRect) = baseRect.splitVertically(0.4)
    XCTAssertEqual(topRect, CGRect(x: 10, y: 10, width: 150, height: 60), "splitHorizontally: top rect incorrect")
    XCTAssertEqual(bottomRect, CGRect(x: 10, y: 70, width: 150, height: 90), "splitHorizontally: bottom rect incorrect")
  }
}
