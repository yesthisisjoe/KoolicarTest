//
//  VehicleDetailsView.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-07.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

class VehicleDetailsView: UIView {

    @IBOutlet weak var manufacturerModelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var placesLabel: UILabel!
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var gearsLabel: UILabel!
    
    var vehicle: Vehicle! {
        didSet {
            if vehicle != nil {
                DispatchQueue.main.async {
                    self.setUpView()
                }
            }
        }
    }
    
    /// Performs initial view setup
    func setUpView() {
        manufacturerModelLabel.text = "\(vehicle.brand) \(vehicle.vehicleModel)"
        yearLabel.text = "\(vehicle.year)"
        categoryLabel.text = vehicle.category.readableString
        placesLabel.text = "\(vehicle.placesCount) places"
        doorsLabel.text = "\(vehicle.doorsCount) portes"
        fuelLabel.text = vehicle.fuelTypeCD.readableString
        gearsLabel.text = vehicle.gearsTypeCD.readableString
    }
}
