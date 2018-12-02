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

    var posts: [Post]? {
        didSet {
            self.mapView.removeAnnotations(self.mapView.annotations)
            if let posts = self.posts {
                self.mapView.addAnnotations(posts)
            }
        }
    }
    var delegate: PostListingProtocol?

    let regionRadius: CLLocationDistance = 1000
    let initialLocation = CLLocation(latitude: 37.3885491, longitude: -121.9323874)

    var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.register(AnnotationView.self, forAnnotationViewWithReuseIdentifier: AnnotationView.reuseIdentifier())
        return mapView
    }()

    override func setup() {
        self.addSubview(self.mapView)
        self.mapView.pinToEdgesOfSuperview()

        self.centerMapOnLocation(location: self.initialLocation)
        self.mapView.delegate = self
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Post else {
            return nil

        }
        var view: AnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: AnnotationView.reuseIdentifier()) as? AnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = AnnotationView(annotation: annotation, reuseIdentifier: AnnotationView.reuseIdentifier())
            view.canShowCallout = false
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let post = view.annotation as? Post {
            self.delegate?.didTapOn(post: post)
        }
    }
}
