//
//  VehicleTableViewCellTests.swift
//  KoolicarTestTests
//
//  Created by Joe Peplowski on 2017-11-07.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import XCTest
import UIKit
@testable import KoolicarTest

class VehicleTableViewCellTests: XCTestCase {
    
    var vehicleTableViewCell0, vehicleTableViewCell1: VehicleTableViewCell!
    
    override func setUp() {
        super.setUp()
        let vehicleTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehicleTableViewController") as! VehicleTableViewController
        
        vehicleTableViewCell0 =  vehicleTableViewController.tableView.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleTableViewCell
        vehicleTableViewCell1 =  vehicleTableViewController.tableView.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleTableViewCell
        TestVehicles.shared.setUpVehicles()
        vehicleTableViewCell0.vehicle = TestVehicles.shared.vehicle0
        vehicleTableViewCell1.vehicle = TestVehicles.shared.vehicle1
        
        vehicleTableViewCell0.setUpView()
        vehicleTableViewCell1.setUpView()
    }
    
    override func tearDown() {
        vehicleTableViewCell0 = nil
        vehicleTableViewCell1 = nil
        TestVehicles.shared.tearDownVehicles()
        super.tearDown()
    }
    
    // Checks that the view's labels correspond to the vehicle's information
    func testSetVehicle() {
        XCTAssertEqual([vehicleTableViewCell0.manufacturerModelLabel.text!, vehicleTableViewCell0.placesTransmissionLabel.text!, vehicleTableViewCell0.yearLocationLabel.text!, vehicleTableViewCell0.categoryLabel.text!], ["Nissan Micra", "Essence . 5 places . Manuelle", "2012 . Paris 11'e8me", "Citadine"])
        XCTAssertEqual([vehicleTableViewCell1.manufacturerModelLabel.text!, vehicleTableViewCell1.placesTransmissionLabel.text!, vehicleTableViewCell1.yearLocationLabel.text!, vehicleTableViewCell1.categoryLabel.text!], ["Citroen C4 Picasso", "Diesel . 7 places . Automatique", "2008 . Paris 11'e8me", "Familiale"])
    }
}
