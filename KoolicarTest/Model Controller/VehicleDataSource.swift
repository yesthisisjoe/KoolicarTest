//
//  VehicleDataSource.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit


/// Data source used by the VehicleTableView
class VehicleDataSource: NSObject {
    private let vehicleCellIdentifier = "VehicleCell"
    
    var vehicleController: VehicleController
    
    init(vehicleController: VehicleController) {
        self.vehicleController = vehicleController
    }
    
    /// Reloads a table view cell only if is visible on the screen
    func reloadCellIfVisible(tableView: UITableView, indexPath: IndexPath) {
        DispatchQueue.main.async {
            if tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}


// MARK: - UITableViewDataSource methods
extension VehicleDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleController.vehicles.count
    }
    
    /// If a Vehicle does not have a downloaded thumbnail image,
    /// this method starts the download and reloads when complete
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: vehicleCellIdentifier) as! VehicleTableViewCell
        let vehicle = vehicleController.vehicles[indexPath.row]
        if vehicle.thumbnailImage == nil {
            vehicleController.downloadImageForVehicle(atIndex: indexPath.row) {
                self.reloadCellIfVisible(tableView: tableView, indexPath: indexPath)
            }
        }
        cell.vehicle = vehicle
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching methods
extension VehicleDataSource: UITableViewDataSourcePrefetching {
    /// Sets up cells that are likely to be shown,
    /// starting image downloads if necessary
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            vehicleController.downloadImageForVehicle(atIndex: indexPath.row) {
                self.reloadCellIfVisible(tableView: tableView, indexPath: indexPath)
            }
        }
    }
    
    /// Cancels image downloads in progress if a cell
    /// is no longer likely to be visible
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            vehicleController.cancelImageDownloadForVehicle(atIndex: indexPath.row)
        }
    }
}
