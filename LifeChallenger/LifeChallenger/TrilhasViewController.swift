//
//  TrilhasViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class TrilhasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: add number of from cloudant
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrilhaCell", for: indexPath) as! TrilhasTableViewCell
        
        cell.imageTrilhas.image = UIImage(named: <#T##String#>)
        cell.labelTrilhas.text = ""
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
