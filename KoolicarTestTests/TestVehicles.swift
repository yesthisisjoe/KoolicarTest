//
//  VehicleTestController.swift
//  KoolicarTestTests
//
//  Created by Joe Peplowski on 2017-11-07.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import Foundation
@testable import KoolicarTest

class TestVehicles {
    static let shared = TestVehicles()
    
    var vehicle0, vehicle1: Vehicle!
    
    func setUpVehicles() {
        let bundle = Bundle(for: type(of: self))
        
        let filePath0 = bundle.path(forResource: "TestVehicle0", ofType: "json")!
        let filePath1 = bundle.path(forResource: "TestVehicle1", ofType: "json")!
        
        let data0 = try! Data(contentsOf: URL(fileURLWithPath: filePath0), options: .mappedIfSafe)
        let data1 = try! Data(contentsOf: URL(fileURLWithPath: filePath1), options: .mappedIfSafe)
        
        vehicle0 = try! JSONDecoder().decode(Vehicle.self, from: data0)
        vehicle1 = try! JSONDecoder().decode(Vehicle.self, from: data1)
    }
    
    func tearDownVehicles() {
        vehicle0 = nil
        vehicle1 = nil
    }
}
