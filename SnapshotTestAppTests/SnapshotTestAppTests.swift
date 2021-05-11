//
//  SnapshotTestAppUITests.swift
//  SnapshotTestAppUITests
//
//  Created by Rafael Krentz on 09/05/21.
//

import UIKit
import Foundation
import XCTest
import SnapshotTesting
@testable import SnapshotTestApp

class SnapshotTestAppTests: XCTestCase {

    func test_viewControllerBackgroundColor() {
         verifyViewController(ViewController(), named: "Default")
     }
     
     private func verifyViewController(_ viewController: UIViewController, named: String) {
         let devices: [String: ViewImageConfig] = ["iPhoneX": .iPhoneX,
                                                   "iPhone8": .iPhone8,
                                                   "iPhoneSe": .iPhoneSe]
         
         let results = devices.map { device in
             verifySnapshot(matching: viewController,
                            as: .image(on: device.value),
                            named: "\(named)-\(device.key)",
                            testName: "ViewController")
         }
         
         results.forEach { XCTAssertNil($0) }
     }
}
