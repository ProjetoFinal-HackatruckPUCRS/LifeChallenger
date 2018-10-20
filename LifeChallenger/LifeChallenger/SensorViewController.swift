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
        self.batimento.text = "Seu batimento:\n Buscando na nuvem..."
        setupGif()
        setupRefresh()
        
        
    }
    
    func setupGif() {
        let gif_user = UIImage.gifImageWithName("heart")
        let image = UIImageView(image: gif_user)
        image.frame = CGRect(x: 40, y: 425, width:self.view.frame.size.width - 80, height: 200.0)
        image.layer.cornerRadius = 100
        image.clipsToBounds = true
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
            self.batimento.text = "Seu batimento:\n" + bat.batimento.description + " por minuto"
        }
        
        
        // Schedule
        DispatchQueue.main.asyncAfter(deadline: .now() + refreshingTime) {
            self.fetchDataFromServerAndScheduleNextCall()
        }
        
    }
}
