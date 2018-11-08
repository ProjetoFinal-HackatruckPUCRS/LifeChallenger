//
//  SensorViewController.swift
//  LifeChallenger
//
//  Created by student on 07/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController {
    
    
    @IBOutlet weak var batimento: UILabel!
    
    private let refreshingTime: TimeInterval = 2.0 // Seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGif()
        setupRefresh()
        
        
    }
    
    func setupGif() {
        let gif_user = UIImage.gifImageWithName("heart")
        let image = UIImageView(image: gif_user)
        image.frame = CGRect(x: 20, y: 500, width:self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(image)
    }

    func setupRefresh() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + refreshingTime) { 
            self.fetchDataFromServerAndScheduleNextCall()
        }
        
    }
    
    func fetchDataFromServerAndScheduleNextCall() {
        
        // Fetch
//        var bat : SensorBMP
        SensorDAO.getInfo { (bat) in
            self.batimento.text = bat.batimento.description
        }
        
        
        // Schedule
        DispatchQueue.main.asyncAfter(deadline: .now() + refreshingTime) {
            self.fetchDataFromServerAndScheduleNextCall()
        }
        
    }
}
