//
//  VehicleController.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

/// Manages storage of vehicles & network operations for their images
class VehicleController {
    private let vehicleFileName = "TestTechniqueKoolicariOS"
    private let vehicleFileType = "json"
    
    var vehicles: [Vehicle]!
    var vehicleImageDownloadTasks: [Int: URLSessionTask] = [:]
    
    init() {
        vehicles = fetchVehiclesFromFile()
    }
    
    /// Loads vehicles from the provided JSON file
    func fetchVehiclesFromFile() -> [Vehicle] {
        let filePath = Bundle.main.path(forResource: vehicleFileName, ofType: vehicleFileType)!
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
            let vehicleWrapper = try JSONDecoder().decode(VehicleWrapper.self, from: data)
            let vehicles = vehicleWrapper.vehicles
            return vehicles
        } catch {
            print("Error fetching vehicles from JSON file: \(error)")
            return []
        }
    }
    
    /// Downloads a vehicle's corresponding thumbnail image
    func downloadImageForVehicle(atIndex index: Int, completion: @escaping () -> ()) {
        let vehicle = vehicles[index]
        let url = vehicle.thumbnailURL
        
        guard !vehicleImageDownloadTasks.keys.contains(vehicle.id) else {
            // Image download is already in progress
            return
        }
        
        let downloadTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.vehicles[index].thumbnailImage = image
                completion()
            }
        }
        downloadTask.resume()
        vehicleImageDownloadTasks[vehicle.id] = downloadTask
    }
    
    /// Cancels a vehicle image download that is in progress
    func cancelImageDownloadForVehicle(atIndex index: Int) {
        let vehicle = vehicles[index]
        
        guard vehicleImageDownloadTasks.keys.contains(vehicle.id) else { return }
        let task = vehicleImageDownloadTasks[vehicle.id]!
        task.cancel()
        vehicleImageDownloadTasks.removeValue(forKey: vehicle.id)
    }
    
    /// Cancels all vehicle image download tasks that are in progress
    func cancelAllImageDownloadTasks() {
        for key in vehicleImageDownloadTasks.keys {
            vehicleImageDownloadTasks[key]?.cancel()
            vehicleImageDownloadTasks.removeValue(forKey: key)
        }
    }
}
