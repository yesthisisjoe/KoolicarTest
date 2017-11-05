//
//  VehicleDetailsViewTests.swift
//  KoolicarTestTests
//
//  Created by Joe Peplowski on 2017-11-08.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import XCTest
@testable import KoolicarTest

class VehicleDetailsViewTests: XCTestCase {
    var vehicleDetailsView0, vehicleDetailsView1: VehicleDetailsView!
    
    override func setUp() {
        super.setUp()
        let vehicleViewController0 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleViewController") as! VehicleViewController
        let vehicleViewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleViewController") as! VehicleViewController
        
        TestVehicles.shared.setUpVehicles()
        
        vehicleViewController0.vehicle = TestVehicles.shared.vehicle0
        vehicleViewController1.vehicle = TestVehicles.shared.vehicle1
        
        vehicleViewController0.loadView()
        vehicleViewController1.loadView()
        
        vehicleDetailsView0 = vehicleViewController0.vehicleDetailsView
        vehicleDetailsView1 = vehicleViewController1.vehicleDetailsView
        
        vehicleDetailsView0.vehicle = TestVehicles.shared.vehicle0
        vehicleDetailsView1.vehicle = TestVehicles.shared.vehicle1
        
        vehicleDetailsView0.setUpView()
        vehicleDetailsView1.setUpView()
    }
    
    override func tearDown() {
        vehicleDetailsView0 = nil
        vehicleDetailsView1 = nil
        TestVehicles.shared.tearDownVehicles()
        super.tearDown()
    }
    
    // Checks that the view's labels correspond to the vehicle's information
    func testSetVehicle() {
        XCTAssertEqual([vehicleDetailsView0.manufacturerModelLabel.text!, vehicleDetailsView0.yearLabel.text!, vehicleDetailsView0.categoryLabel.text!, vehicleDetailsView0.placesLabel.text!, vehicleDetailsView0.doorsLabel.text!, vehicleDetailsView0.fuelLabel.text!, vehicleDetailsView0.gearsLabel.text!], ["Nissan Micra", "2012", "Citadine", "5 places", "5 portes", "Essence", "Manuelle"])
        XCTAssertEqual([vehicleDetailsView1.manufacturerModelLabel.text!, vehicleDetailsView1.yearLabel.text!, vehicleDetailsView1.categoryLabel.text!, vehicleDetailsView1.placesLabel.text!, vehicleDetailsView1.doorsLabel.text!, vehicleDetailsView1.fuelLabel.text!, vehicleDetailsView1.gearsLabel.text!], ["Citroen C4 Picasso", "2008", "Familiale", "7 places", "5 portes", "Diesel", "Automatique"])
    }
}
