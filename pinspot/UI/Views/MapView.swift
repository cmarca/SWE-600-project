//
//  MapView.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import MapKit

class MapView: View {

    let regionRadius: CLLocationDistance = 1000
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

    var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

    override func setup() {
        self.addSubview(self.mapView)
        self.mapView.pinToEdgesOfSuperview()

        self.centerMapOnLocation(location: self.initialLocation)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
}
