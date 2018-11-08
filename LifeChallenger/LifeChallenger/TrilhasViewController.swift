//
//  TrilhasViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class TrilhasViewController: UIViewController {
    
    @IBOutlet weak var trilhasCollection: UICollectionView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var trilhas : [Trilha] = []
    var trilhaSelecionada : Trilha?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TrilhasDAO.getInfo { (trilha) in
            self.trilhas = trilha
            self.trilhasCollection.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is OpcoesViewController{
            let vc = segue.destination as? OpcoesViewController

            vc?.trilha = trilhaSelecionada
        }
    }
}


extension TrilhasViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        trilhaSelecionada = trilhas[indexPath.row]
        performSegue(withIdentifier: "opcoesSegue", sender: nil)
    }
    
}

extension TrilhasViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trilhas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrilhaCell", for: indexPath) as! TrilhasCollectionViewCell
        
        cell.imagem.image = UIImage(named: "Esportes");
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = UIScreen.main.bounds
        
        return CGSize(width: 180, height: 260)
    }
    
}
