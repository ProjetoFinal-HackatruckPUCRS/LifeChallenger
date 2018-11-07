//
//  ViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let workLocation = CLLocation(latitude: -30.0593446, longitude: -51.1756799)
    let homeLocation = CLLocation(latitude: -30.0697004, longitude: -51.2047768)
    
    @IBAction func CalculateRoutes(_ sender: UIButton) {
        setupRota()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCoreLocation()
        
        mapKitView.delegate = self
        
        setupLongPressGesture()
        
        
    }
    
    
    func setupCoreLocation() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
    }
    
    func center(on location: CLLocation) {
        
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        
        mapKitView.setRegion(region, animated: false )
    }
    
    private func setupLongPressGesture() {
        //long press to recognize
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        mapKitView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UILongPressGestureRecognizer) {
        
        
        if recognizer.state == .ended {
            
            let location = recognizer.location(in: mapKitView)
            let coordinate = mapKitView.convert(location, toCoordinateFrom: mapKitView)
            
            //add pin
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapKitView.addAnnotation(annotation)
            print(#function)
        }
    }
    
    var firstTime = true
}

// Location manager delegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedWhenInUse:
            //começar a procurar localização
            manager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.first!
        print(location.coordinate)
        
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if firstTime {
            firstTime = false
            
            center(on: homeLocation)
            
            let homeAnnotation = MapLocation(title: "home", coordinate: homeLocation.coordinate)
            let  workAnnotation = MapLocation(title: "work", coordinate: workLocation.coordinate)
            
            mapView.addAnnotations([homeAnnotation, workAnnotation])
            
        }
    }
    
}

extension ViewController{
    func setupRota() {
        let sourceLocation = homeLocation.coordinate
        let destinationLocation = workLocation.coordinate
        
        
        let sourcePlacemark = MKPlacemark (coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark (coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Casa"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "PUCRS"
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        self.mapKitView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        
        let directions = MKDirections(request: directionRequest)
        
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapKitView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapKitView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = .red
        renderer.lineWidth = 4.0
        return renderer
    }
}

