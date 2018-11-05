import UIKit

class PerguntasController: UIViewController, UITableViewDataSource {
    
    var respostas : [Resposta] = []
    var perguntas : [Pergunta] = [];
    var perguntaAtual: Pergunta?;
    var indexPergunta: Int = 0;
    
    @IBOutlet weak var tituloPergunta: UILabel!
    
    override func viewDidLoad() {
        respostas.append(Resposta(resposta:"Sim", peso: 5))
        respostas.append(Resposta(resposta: "Não", peso: 3))
        
        perguntas.append(Pergunta(pergunta: "Você já corre?", respostas: respostas))
        perguntas.append(Pergunta(pergunta: "Você já caminha na rua como exercício?", respostas: respostas))
        perguntas.append(Pergunta(pergunta: "Você malha?", respostas: respostas))
        
        self.perguntaAtual = perguntas[0]
        self.tituloPergunta.text = perguntaAtual?.pergunta
        
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if ultima pergunta vai pra proxima tela
        // else carrega nova pergunta
        
        
    }
    
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

extension PerguntasController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pergunta = perguntaAtual{
            let resposta = pergunta.respostas[indexPath.row]
        
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
        
}
