//
//  VehicleTableViewController.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

class VehicleTableViewController: UITableViewController {
    private let navigationBarColor = UIColor(red: 16.0/255.0, green: 32.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    private let navigationBarTextColor = UIColor.white
    private let navigationBarFont = UIFont(name: "AvenirNext-Medium", size: 15.0)!
    
    var vehicleController: VehicleController!
    private var dataSource: VehicleDataSource!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBarAppearance()
        dataSource = VehicleDataSource(vehicleController: vehicleController)
        tableView.dataSource = dataSource
        tableView.prefetchDataSource = dataSource
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        vehicleController.cancelAllImageDownloadTasks()
    }
    
    /// Sets the appearance of the navigation bar
    func setNavigationBarAppearance() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = navigationBarColor
        navigationController?.navigationBar.titleTextAttributes = [
            .font : navigationBarFont,
            .foregroundColor : navigationBarTextColor
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vehicleViewController = segue.destination as? VehicleViewController {
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            let selectedVehicle = vehicleController.vehicles[selectedIndex]
            vehicleViewController.vehicle = selectedVehicle
            vehicleViewController.vehicleController = vehicleController
        }
    }
}
