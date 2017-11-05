//
//  VehicleTests.swift
//  KoolicarTestTests
//
//  Created by Joe Peplowski on 2017-11-07.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import XCTest
@testable import KoolicarTest

class VehicleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        TestVehicles.shared.setUpVehicles()
    }
    
    override func tearDown() {
        TestVehicles.shared.tearDownVehicles()
        super.tearDown()
    }
    
    /// Test that JSON is accurately decoded into a Vehicle object
    func testDecoding() {
        // VEHICLE 0
        XCTAssertEqual(
            [TestVehicles.shared.vehicle0.addressID, TestVehicles.shared.vehicle0.id, TestVehicles.shared.vehicle0.year, TestVehicles.shared.vehicle0.doorsCount, TestVehicles.shared.vehicle0.placesCount],
            [70076, 10749, 2012, 5, 5]
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle0.fuelTypeCD,
            Vehicle.FuelType.gasoline
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle0.gearsTypeCD,
            Vehicle.GearsType.manual
        )
        XCTAssertEqual(
            [TestVehicles.shared.vehicle0.vehicleModel, TestVehicles.shared.vehicle0.brand, TestVehicles.shared.vehicle0.distanceString!],
            ["Micra", "Nissan", "Paris 11'e8me"]
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle0.thumbnailURL,
            URL(string: "https://koolicar.s3.amazonaws.com/uploads/photo/6103/thumb_2015-11-09_16.13.02.jpg")!
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle0.category,
            Vehicle.Category.citadine
        )
        XCTAssertEqual(
            [TestVehicles.shared.vehicle0.fakeLatitude, TestVehicles.shared.vehicle0.fakeLongitude],
            [48.8619248152841, 2.38026285387939]
        )
        
        // VEHICLE 1
        XCTAssertEqual(
            [TestVehicles.shared.vehicle1.addressID, TestVehicles.shared.vehicle1.id, TestVehicles.shared.vehicle1.year, TestVehicles.shared.vehicle1.doorsCount, TestVehicles.shared.vehicle1.placesCount],
            [16078, 3736, 2008, 5, 7]
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle1.fuelTypeCD,
            Vehicle.FuelType.diesel
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle1.gearsTypeCD,
            Vehicle.GearsType.automatic
        )
        XCTAssertEqual(
            [TestVehicles.shared.vehicle1.vehicleModel, TestVehicles.shared.vehicle1.brand, TestVehicles.shared.vehicle1.distanceString!],
            ["C4 Picasso", "Citroen", "Paris 11'e8me"]
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle1.thumbnailURL,
            URL(string: "https://koolicar.s3.amazonaws.com/uploads/photo/2106/thumb_Hadad-pic.jpg")!
        )
        XCTAssertEqual(
            TestVehicles.shared.vehicle1.category,
            Vehicle.Category.familiale
        )
        XCTAssertEqual(
            [TestVehicles.shared.vehicle1.fakeLatitude, TestVehicles.shared.vehicle1.fakeLongitude],
            [48.8676012152841, 2.383478008763]
        )
    }
}
