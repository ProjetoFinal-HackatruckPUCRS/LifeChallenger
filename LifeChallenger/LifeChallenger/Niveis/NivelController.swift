import UIKit

class NivelController: UIViewController  {
    
    var titulo : String?
    @IBOutlet weak var NivelTitulo: UILabel!
    
    override func viewDidLoad() {
        NivelTitulo.text = titulo
        super.viewDidLoad()
    }
    
}
