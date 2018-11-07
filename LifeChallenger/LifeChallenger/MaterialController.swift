import Foundation
import UIKit


class MaterialController : UIViewController, UITableViewDataSource {
    
    var materiais : [String]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let materiais = materiais{
            return materiais.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "materiais", for: indexPath) as! CellResposta
        if let materiais = materiais{
            cell.label.text = materiais[indexPath.row]
        }
        return (cell)
    }
}
