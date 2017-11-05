//
//  VehicleLocationMapView.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-07.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit
import MapKit

class VehicleLocationMapView: MKMapView {
    
    private let span = 0.01
    private let circleRadius: CLLocationDistance = 400
    private let circleColor = UIColor.green.withAlphaComponent(0.5)
    
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
        delegate = self
        let mapCenterCoordinate = CLLocationCoordinate2DMake(vehicle.fakeLatitude, vehicle.fakeLongitude)
        let region = MKCoordinateRegionMake(mapCenterCoordinate, MKCoordinateSpanMake(span, span))
        setRegion(region, animated: false)
        let circle = MKCircle(center: mapCenterCoordinate, radius: circleRadius)
        removeOverlays(overlays)
        add(circle)
    }
}

extension VehicleLocationMapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = circleColor
        return circleRenderer
    }
}
