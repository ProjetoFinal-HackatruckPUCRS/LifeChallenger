//
//  SensorViewController.swift
//  LifeChallenger
//
//  Created by student on 07/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gif_user = UIImage.gifImageWithName("heart")
        let image = UIImageView(image: gif_user)
        image.frame = CGRect(x: 20, y: 500, width:self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(image)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
