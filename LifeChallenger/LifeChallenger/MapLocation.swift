//
//  MapLocation.swift
//  LifeChallenger
//
//  Created by student on 07/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import MapKit

class MapLocation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    
    init (title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        super.init()
    }
    
    var subtitle: String? { return "I`m at \(coordinate)" }
}
