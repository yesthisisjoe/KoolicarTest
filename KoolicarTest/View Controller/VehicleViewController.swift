//
//  VehicleViewController.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit
import MapKit

class VehicleViewController: UIViewController {

    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var mapView: VehicleLocationMapView!
    @IBOutlet weak var vehicleDetailsView: VehicleDetailsView!
    
    var vehicle: Vehicle!
    var vehicleController: VehicleController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
        vehicleDetailsView.vehicle = vehicle
        mapView.vehicle = vehicle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setThumbnailImage()
    }
    
    /// Styles the appearance of the navigation bar
    func setNavigationBarAppearance() {
        // Sets the back button image
        let backImage = #imageLiteral(resourceName: "BackButton")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        // Make navigation bar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
    }

    /// Sets the vehicle's thumbnail image
    func setThumbnailImage() {
        if let thumbnailImage = vehicle.thumbnailImage {
            // The thumbnail already downloaded
            vehicleImageView.image = thumbnailImage
        } else {
            // Start downloading the thumbnail image & set it once complete
            let indexOfVehicle = vehicleController.vehicles.index(where: {$0.id == vehicle.id})!
            vehicleController.downloadImageForVehicle(atIndex: indexOfVehicle) {
                if let thumbnailImage = self.vehicleController.vehicles[indexOfVehicle].thumbnailImage {
                    DispatchQueue.main.async {
                        self.vehicleImageView.image = thumbnailImage
                    }
                }
            }
        }
    }
}
