import UIKit

class PerguntasController: UIViewController {
    
    var perguntasService = PerguntasService()
    var niveisService = NiveisService()
    
    var perguntas : [Pergunta] = [];
    var perguntaAtual: Pergunta?;
    var indexPergunta: Int = 0;
    var pesoTotal = 0;
    
    @IBOutlet weak var tituloPergunta: UILabel!
    
    override func viewDidLoad() {
        self.perguntas = perguntasService.getPerguntas()
        
        self.perguntaAtual = perguntas[0]
        self.tituloPergunta.text = perguntaAtual?.pergunta
        
        super.viewDidLoad()
    }
}

extension PerguntasController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pergunta = perguntaAtual{
            let resposta = pergunta.respostas[indexPath.row]
            pesoTotal += resposta.peso
            
        
            let perguntasRestantes = (perguntas.count - 1) - indexPergunta
            self.indexPergunta += 1
            let temNovaPergunta =  perguntasRestantes != 0
            
            if temNovaPergunta{
                perguntaAtual = perguntas[indexPergunta]
                self.tituloPergunta.text = perguntaAtual?.pergunta
                tableView.reloadData()
            }
            else{
                performSegue(withIdentifier: "perguntasRespondidas", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let novaTela = segue.destination as! NivelController
        let nivel = niveisService.nivel(pesoTotal: pesoTotal)
        
        novaTela.titulo = "Seu nível é \(nivel)"
    }
}

extension PerguntasController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pergunta = perguntaAtual{
            return pergunta.respostas.count;
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resposta", for: indexPath) as! CellResposta
        
        if let pergunta = perguntaAtual{
            let resposta = pergunta.respostas[indexPath.row]
            cell.label.text = resposta.resposta
        }
        
        return (cell)
    }
}
