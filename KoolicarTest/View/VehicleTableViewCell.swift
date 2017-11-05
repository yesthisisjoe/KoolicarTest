//
//  VehicleTableViewCell.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var manufacturerModelLabel: UILabel!
    @IBOutlet weak var placesTransmissionLabel: UILabel!
    @IBOutlet weak var yearLocationLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
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
        if let thumbnailImage = vehicle.thumbnailImage {
            thumbnailImageView.image = thumbnailImage
        } else {
            let placeholderImage = #imageLiteral(resourceName: "EmptyVehicleImage")
            thumbnailImageView.image = placeholderImage
        }
        manufacturerModelLabel.text = "\(vehicle.brand) \(vehicle.vehicleModel)"
        placesTransmissionLabel.text = "\(vehicle.fuelTypeCD.readableString) . \(vehicle.placesCount) places . \(vehicle.gearsTypeCD.readableString)"
        yearLocationLabel.text = "\(vehicle.year) . \(vehicle.distanceString ?? "")"
        categoryLabel.text = vehicle.category.readableString
    }
}
