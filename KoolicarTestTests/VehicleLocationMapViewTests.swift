//
//  VehicleLocationMapViewTests.swift
//  KoolicarTestTests
//
//  Created by Joe Peplowski on 2017-11-08.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import XCTest
import MapKit
@testable import KoolicarTest

class VehicleLocationMapViewTests: XCTestCase {
    
    var vehicleLocationMapView0, vehicleLocationMapView1: VehicleLocationMapView!
    
    override func setUp() {
        super.setUp()
        let vehicleViewController0 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleViewController") as! VehicleViewController
        let vehicleViewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleViewController") as! VehicleViewController
        
        TestVehicles.shared.setUpVehicles()
        
        vehicleViewController0.vehicle = TestVehicles.shared.vehicle0
        vehicleViewController1.vehicle = TestVehicles.shared.vehicle1
        
        vehicleViewController0.loadView()
        vehicleViewController1.loadView()
        
        vehicleLocationMapView0 = vehicleViewController0.mapView
        vehicleLocationMapView1 = vehicleViewController1.mapView
        
        vehicleLocationMapView0.vehicle = TestVehicles.shared.vehicle0
        vehicleLocationMapView1.vehicle = TestVehicles.shared.vehicle1
        
        vehicleLocationMapView0.setUpView()
        vehicleLocationMapView1.setUpView()
    }
    
    override func tearDown() {
        vehicleLocationMapView0 = nil
        vehicleLocationMapView1 = nil
        TestVehicles.shared.tearDownVehicles()
        super.tearDown()
    }
    
    func roundedCoordinate(_ unrounded: CLLocationDegrees) -> String {
        return String(format: "$%.11f", unrounded)
    }
    
    // Checks that a map's center & overlays correspond to the vehicle's location
    func testMap() {
        let vehicle0LocationCoordinate = CLLocationCoordinate2D(latitude: TestVehicles.shared.vehicle0.fakeLatitude, longitude: TestVehicles.shared.vehicle0.fakeLongitude)
        XCTAssertEqual([
            roundedCoordinate(vehicleLocationMapView0.region.center.latitude),
            roundedCoordinate(vehicleLocationMapView0.region.center.longitude)
        ], [
            roundedCoordinate(vehicle0LocationCoordinate.latitude),
            roundedCoordinate(vehicle0LocationCoordinate.longitude)
        ])
        XCTAssertEqual([
            roundedCoordinate(vehicleLocationMapView0.overlays[0].coordinate.latitude),
            roundedCoordinate(vehicleLocationMapView0.overlays[0].coordinate.longitude)
        ], [
            roundedCoordinate(vehicle0LocationCoordinate.latitude),
            roundedCoordinate(vehicle0LocationCoordinate.longitude)
        ])
        XCTAssert(vehicleLocationMapView0.overlays.count == 1)
        
        let vehicle1LocationCoordinate = CLLocationCoordinate2D(latitude: TestVehicles.shared.vehicle1.fakeLatitude, longitude: TestVehicles.shared.vehicle1.fakeLongitude)
        XCTAssertEqual([
            roundedCoordinate(vehicleLocationMapView1.region.center.latitude),
            roundedCoordinate(vehicleLocationMapView1.region.center.longitude)
            ], [
                roundedCoordinate(vehicle1LocationCoordinate.latitude),
                roundedCoordinate(vehicle1LocationCoordinate.longitude)
            ])
        XCTAssertEqual([
            roundedCoordinate(vehicleLocationMapView1.overlays[0].coordinate.latitude),
            roundedCoordinate(vehicleLocationMapView1.overlays[0].coordinate.longitude)
            ], [
                roundedCoordinate(vehicle1LocationCoordinate.latitude),
                roundedCoordinate(vehicle1LocationCoordinate.longitude)
            ])
        XCTAssert(vehicleLocationMapView1.overlays.count == 1)
    }
    
}
