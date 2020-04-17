//: A UIKit based Playground for presenting user interface
import UIKit
import PlaygroundSupport

//cria nova fonte
let cfURL = Bundle.main.url(forResource: "SF-Pro-Text-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
let cfURL2 = Bundle.main.url(forResource: "SF-Pro-Text-Bold", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)
let cfURL3 = Bundle.main.url(forResource: "SF-Pro-Rounded-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)
let cfURL4 = Bundle.main.url(forResource: "SF-Pro-Rounded-Bold", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
let cfURL5 = Bundle.main.url(forResource: "SF-Mono-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL5, CTFontManagerScope.process, nil)

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .roxoBackground
        let textViewText = " O playground Nome te mostra as descobertas e histórias das mulheres da ciência, tecnologia, engenharia e matemática"
        let textView = createTextView(text: textViewText)
        
        
        let btnNext = createButtonNext()
        btnNext.addTarget(nil, action: #selector(tapBtnNext), for: .touchUpInside)
        
        view.addSubview(textView)
        view.addSubview(btnNext)
        
        self.view = view
    }
    
    @objc func tapBtnNext() {
        navigationController?.pushViewController(mySecondViewController, animated: true)
    }
    
    
}

class MySecondViewController : UIViewController{
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .roxoBackground
        let textViewText = " Encontre os objetos clicáveis dos cenários e descubra mais sobre as mulheres, suas invenções e descobertas"
        let textView = createTextView(text: textViewText)
        
        view.addSubview(textView)
        
        let btnPreview = createButtonPreview()
        btnPreview.addTarget(nil, action: #selector(tapBtnPreview), for: .touchUpInside)
        
        view.addSubview(btnPreview)
        
        let btnNext = createButtonNext()
        btnNext.addTarget(nil, action: #selector(tapBtnNext), for: .touchUpInside)
        view.addSubview(btnNext)
        
        self.view = view
    }
    
    @objc func tapBtnPreview() {
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func tapBtnNext() {
        navigationController?.pushViewController(myThirdViewController, animated: true)
    }
}

class MyThirdViewController : UIViewController{
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .roxoBackground
        let textViewText = " Você pode trocar de cenário encontrando todos os objetos de uma cena - são 2 ambientes: laboratório e espaço"
        
        let textView = createTextView(text: textViewText)
        
        view.addSubview(textView)
        
        let btnPreview = createButtonPreview()
        btnPreview.addTarget(nil, action: #selector(tapBtnPreview), for: .touchUpInside)
        
        view.addSubview(btnPreview)
        
        let btnNext = createButtonNext()
        btnNext.addTarget(nil, action: #selector(tapBtnNext), for: .touchUpInside)
        
        view.addSubview(btnNext)
        
        self.view = view
    }
    
    @objc func tapBtnPreview() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapBtnNext() {
        navigationController?.pushViewController(laboratoryViewController, animated: true)
    }
    
}


class LaboratoryViewController: UIViewController{
    public var tapM = false
    public var tapP = false
    public var tapB = false
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        view.addSubview(createImg())
        
        let btnMicroscope = createBtnMicroscope()
        btnMicroscope.tag = 0
        btnMicroscope.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        
        view.addSubview(btnMicroscope)
        
        let btnPc = createBtnPc()
        btnPc.tag = 1
        btnPc.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        
        view.addSubview(btnPc)
        
        let btnBoard = createBtnBoard()
        btnBoard.tag = 2
        btnBoard.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        view.addSubview(btnBoard)
        
        self.view = view
    }
    
    
    @objc func tapBtn(sender: UIButton) {
        if sender.tag == 0 {
            tapM = true
            //present(francoiseViewController, animated: true)
            navigationController?.pushViewController(francoiseViewController, animated: true)
        }
        if sender.tag == 1 {
            tapP = true
            navigationController?.pushViewController(rosalindViewController, animated: true)
        }
        if sender.tag == 2 {
            tapB = true
            navigationController?.pushViewController(marieViewController, animated: true)
        }
        
        
    }
    
    func createBtnMicroscope() -> UIButton{
        let image = UIImage(named: "microscope.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 591, y: 491, width: 99, height: 150)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    
    func createBtnPc() -> UIButton{
        let image = UIImage(named: "pc.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 818, y: 452, width: 221, height: 188)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    
    func createBtnBoard() -> UIButton{
        let image = UIImage(named: "quadro.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 929, y: -56, width: 626, height: 458)
        btn.setImage(image, for: .normal)
        
        return btn
    }
    
    
    func createImg() -> UIImageView{
        let imagem = UIImage(named: "img_lab1.png")
        let imgView = UIImageView()
        
        imgView.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        imgView.image = imagem
        imgView.addSubview(createLabel1())
        imgView.addSubview(createLabelName())
        
        
        return imgView
    }
    
    func createLabel1() -> UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 644, y: 43, width: 160, height: 30)
        label.text = "Você está no"
        label.textColor = .roxoBackground
        label.font = UIFont(name: "SFProtext-Regular", size: 25)
        
        return label
    }
    
    func createLabelName() -> UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 584, y: 88, width: 300, height: 48)
        label.text = "LABORATÓRIO"
        label.textColor = .roxoBackground
        label.font = UIFont(name: "SFProtext-Bold", size: 40)
        
        return label
    }
    
    //fim do laboratory viewcontroller
}

class RosalindViewController : UIViewController{
    
    let rosalind = Mulher(nome: "ROSALIND FRANKLIN", descricao: "  Rosalind Franklin realizou doutorado em Física e Química. Foi a responsável pelos estudos com cristalografia de raios-x que permitiu a descoberta da estrutura de dupla hélice do DNA.\n\n  Rosalind jamais foi premiada pela sua descoberta, ficando com Watson e Crick os créditos pela descoberta da estrutura do DNA.", imagem: UIImage(named: "card_rosalind")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewPc = createViewCardPc()
        view.addSubview(viewPc)
        
        
        self.view = view
    }
    
    func createViewCardPc() -> UIView{
        let view = UIImageView(image: UIImage(named: "bgLab.png"))
        let frame = CGRect(x: 271, y: 364, width: 495, height: 456)
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewCard = createCard(content: rosalind,frame: frame )
        viewCard.addSubview(btnContinue)
        
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.addSubview(viewCard)
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        return view
    }
    
    @objc func tapBtnContinue() {
        if laboratoryViewController.tapM && laboratoryViewController.tapB && laboratoryViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalLabViewController, animated: true)
            
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
}

class MarieViewController : UIViewController{
    
    let marie = Mulher(nome: "MARIE CURIE", descricao: "  Considerada a Mãe Da Física Morderna, Marie Curie é mundialmente conhecida por ser pioneira em pesquisas sobre radioatividade. Além disso ela descobriu os elementos polônio e rádio.\n\n Ela foi a 1ª mulher a ganhar um Nobel e também a 1ª a ser laureada duas vezes com o prêmio. Em química, em 1903, e em física, em 1911. ", imagem: UIImage(named: "card_marie.png")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewBoard = createViewCardBoard()
        
        
        view.addSubview(viewBoard)
        
        
        self.view = view
    }
    
    func createViewCardBoard() -> UIView{
        let view = UIImageView(image: UIImage(named: "bgLab.png"))
        let frame = CGRect(x: 533, y: 175, width: 495, height: 456)
        
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewCard = createCard(content: marie,frame: frame )
        viewCard.addSubview(btnContinue)
        
        
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.backgroundColor = .white
        view.addSubview(viewCard)
        view.isUserInteractionEnabled = true
        return view
    }
    
    @objc func tapBtnContinue() {
        if laboratoryViewController.tapM && laboratoryViewController.tapB && laboratoryViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalLabViewController, animated: true)
            
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
}

class FrancoiseViewController: UIViewController{
    
    let francoise = Mulher(nome: "FRANÇOISE BARRÉ", descricao: "  A virologista francesa foi a responsável por uma das descobertas mais impactantes das últimas décadas. Com o auxílio de dois colegas, Françoise descobriu o HIV, o vírus causador da AIDS, em 1983.\n\n  Junto com seu mentor, Luc Montagnier, Françoise foi laureada com o Nobel de Medicina em 2008.", imagem: UIImage(named: "card_francoise.png")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewMicroscope = createViewCardMicroscope()
        
        
        view.addSubview(viewMicroscope)
        
        
        self.view = view
    }
    
    func createViewCardMicroscope() -> UIView{
        let viewCard = UIImageView(image: UIImage(named: "bgLab.png"))
        let frame = CGRect(x: 728, y: 373, width: 495, height: 456)
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewMicroscope = createCard(content: francoise,frame: frame )
        viewMicroscope.addSubview(btnContinue)
        
        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        viewCard.addSubview(viewMicroscope)
        viewCard.backgroundColor = .white
        viewCard.isUserInteractionEnabled = true
        
        return viewCard
    }
    
    @objc func tapBtnContinue() {
        if laboratoryViewController.tapM && laboratoryViewController.tapB && laboratoryViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalLabViewController, animated: true)
            
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    
}


public class SpaceViewController : UIViewController{
    public var tapP = false
    public var tapR = false
    public var tapB = false
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        view.addSubview(createImg())
        
        let btnPulsar = createBtnPulsar()
        btnPulsar.tag = 0
        btnPulsar.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        view.addSubview(btnPulsar)
        
        let btnBlackHole = createBtnBlackHole()
        btnBlackHole.tag = 1
        btnBlackHole.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        view.addSubview(btnBlackHole)
        
        let btnRocket = createBtnRocket()
        btnRocket.tag = 2
        btnRocket.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        view.addSubview(btnRocket)
        
        
        self.view = view
    }
    
    @objc func tapBtn(sender: UIButton) {
        if sender.tag == 0 {
            tapP = true
            navigationController?.pushViewController(jocellynViewController, animated: true)
        }
        if sender.tag == 1 {
            tapB = true
            navigationController?.pushViewController(katieViewController, animated: true)
            // present(katieViewController, animated: true)
        }
        if sender.tag == 2 {
            tapR = true
            navigationController?.pushViewController(margaretViewController, animated: true)
        }
        
        
    }
    
    func createImg() -> UIImageView{
        let imagem = UIImage(named: "espaco.png")
        let imgView = UIImageView()
        
        imgView.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        imgView.image = imagem
        imgView.addSubview(createLabel1())
        imgView.addSubview(createLabelName())
        
        
        return imgView
    }
    
    func createLabel1() -> UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 644, y: 43, width: 160, height: 30)
        label.text = "Você está no"
        label.textColor = .white
        label.font = UIFont(name: "SFProtext-Regular", size: 25)
        
        return label
    }
    
    func createLabelName() -> UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 584, y: 88, width: 300, height: 48)
        label.text = "ESPACO"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "SFProtext-Bold", size: 40)
        
        return label
    }
    
    func createBtnPulsar() -> UIButton{
        let image = UIImage(named: "pulsar3.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 119.84, y: 161.84, width: 283, height: 283)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    func createBtnBlackHole() -> UIButton{
        let image = UIImage(named: "blackHole.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 835.21, y: 585.32, width: 198, height: 198)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    func createBtnRocket() -> UIButton{
        let image = UIImage(named: "rocket.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 466, width: 785, height: 442)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    
    //fim do spaceviewcontroller
}

public class JocellynViewController: UIViewController{
    
    let jocellyn = Mulher(nome: "JOCELLYN BELL BURNELL", descricao: "   A astrofísica britânica descobriu, junto com seu professor Antony Hewish as primeiras pulsares, estrelas de nêutrons que apresentam campo gravitacional até 1 bilhão de vezes maior que a gravidade na Terra.\n\n  Infelizmente,  Bell não foi citada no trabalho sobre o assunto que foi premiado com um Nobel de Física em 1974.", imagem: UIImage(named: "card_jocellyn.png")!)
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewPulsar = createViewCardPulsar()
        
        
        view.addSubview(viewPulsar)
        
        
        self.view = view
    }
    
    func createViewCardPulsar() -> UIView{
        let viewCard = UIImageView(image: UIImage(named: "bgSpace.png"))
        let frame = CGRect(x: 522, y: 287, width: 519, height: 534)
        
        
        let btnContinue = UIButton(frame: CGRect(x: 155, y: 455, width: 209, height: 40))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewPulsar = createCard2(content: jocellyn,frame: frame )
        viewPulsar.addSubview(btnContinue)
        
        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        viewCard.addSubview(viewPulsar)
        viewCard.isUserInteractionEnabled = true
        
        return viewCard
    }
    
    @objc func tapBtnContinue() {
        if spaceViewController.tapR && spaceViewController.tapB && spaceViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalSpaceViewController, animated: true)
            
        }else{
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
}

public class MargaretViewController: UIViewController{
    
    let margaret = Mulher(nome: "MARGARET HAMILTON", descricao: "       A matemática foi líder da equipe que criou o programa de voo responsável pelo voo Apollo 11, em 1969, que levou os astronautas Neil Armstrong e Buzz Aldrin até a lua.\n\n   Formada em Matemática e pós-graduada em Meteoreologia, Margaret entrou no MIT aos 24 anos. Em meio à corrida espacial americana, se tornou diretora de desenvolvimento de software da Nasa no programa Apollo. ", imagem: UIImage(named: "card_margaret.png")!)
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewRocket = createViewCardRocket()
        
        
        view.addSubview(viewRocket)
        
        
        self.view = view
    }
    
    func createViewCardRocket() -> UIView{
        let viewCard = UIImageView(image: UIImage(named: "bgSpace.png"))
        let frame = CGRect(x: 773, y: 320, width: 519, height: 534)
        
        
        let btnContinue = UIButton(frame: CGRect(x: 155, y: 455, width: 209, height: 40))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewRocket = createCard2(content: margaret,frame: frame )
        viewRocket.addSubview(btnContinue)
        
        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        //viewCard.backgroundColor = .darkGrayBg
        viewCard.isUserInteractionEnabled = true
        viewCard.addSubview(viewRocket)
        
        return viewCard
    }
    
    @objc func tapBtnContinue() {
        if spaceViewController.tapR && spaceViewController.tapB && spaceViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalSpaceViewController, animated: true)
        }else{
            navigationController?.popViewController(animated: true)
        }
        
        
    }
}

public class KatieViewController: UIViewController{
    
    let katie = Mulher(nome: "KATIE BOUMAN", descricao: "    Doutora em engenharia elétrica e ciência da computação pelo MIT, a cientista de 29 anos foi quem liderou a criação do algoritmo que permitiu capturar a imagem de um buraco negro pela primeira vez.\n\n    Os estudos começaram em 2016, quando Katie começou a liderar o desenvolvimento do algoritmo, que reúne dados de vários radiotelescópios  para tornar possÍvel a captura da imagem. ", imagem: UIImage(named: "card_katie.png")!)
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewBlackHole = createViewCardBlackHole()
        
        
        view.addSubview(viewBlackHole)
        
        
        self.view = view
    }
    
    func createViewCardBlackHole() -> UIView{
        let viewCard = UIImageView()
        let frame = CGRect(x: 259, y: 332, width: 519, height: 534)
        
        
        let btnContinue = UIButton(frame: CGRect(x: 155, y: 455, width: 209, height: 40))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewBlackHole = createCard2(content: katie,frame: frame )
        viewBlackHole.addSubview(btnContinue)
        
        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        viewCard.image = UIImage(named: "bgSpace.png")
        viewCard.backgroundColor = .darkGrayBg
        viewCard.addSubview(viewBlackHole)
        viewCard.isUserInteractionEnabled = true
        
        return viewCard
    }
    
    @objc func tapBtnContinue() {
        if spaceViewController.tapR && spaceViewController.tapB && spaceViewController.tapP {
            print("3 descobertos")
            navigationController?.pushViewController(finalSpaceViewController, animated: true)
        }else{
            navigationController?.popViewController(animated: true)
        }
        
        
    }
}

func createCard2(content:Mulher, frame:CGRect) -> UIImageView{
    let view = UIImageView(image: content.getImagem())
    view.frame = frame
    
    
    let label = UILabel(frame: CGRect(x: 32, y: 44, width: 459, height: 28))
    label.text = "Você descobriu"
    label.textAlignment = .center
    label.font = UIFont(name: "SFProRounded-Regular", size: 20)
    label.textColor = .white
    
    view.addSubview(label)
    
    let labelNome = UILabel(frame: CGRect(x: 32, y: 73, width: 459, height: 44))
    labelNome.text = content.getNome()
    labelNome.textAlignment = .center
    labelNome.font = UIFont(name: "SFProRounded-Bold", size: 28)
    labelNome.textColor = .white
    
    view.addSubview(labelNome)
    
    let text = UITextView(frame: CGRect(x: 102, y: 144, width: 321, height: 298))
    text.text = content.getDescricao()
    text.textAlignment = .natural
    text.font = UIFont(name: "SFProText-Regular", size: 18)
    
    text.textColor = .white
    text.backgroundColor = .none
    
    view.addSubview(text)
    
    
    
    view.isUserInteractionEnabled = true
    
    
    return view
    
}

public class FinalLabViewController : UIViewController{
    
    public override func loadView() {
        
        let view = UIView()
        
        
        var cardView = UIImageView()
        
        let img = UIImage(named: "backgroundLab.png")!
        let cardbg = UIImage(named: "backParabensLab.png")!
        
        cardView = createView(imgbg: img, textColor: .grayTextColor, cardbg: cardbg)
        
        
        
        view.addSubview(cardView)
        
        self.view = view
    }
    
    public func createView(imgbg:UIImage, textColor:UIColor, cardbg:UIImage) -> UIImageView{
        let view = UIImageView(image: imgbg)
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.backgroundColor = .white
        
        let labelP = UILabel()
        labelP.frame = CGRect(x: 130, y: 122, width: 350, height: 68)
        labelP.text = "PARABÉNS"
        labelP.font = UIFont(name: "SFProText-Bold", size: 59)
        labelP.textAlignment = .center
        labelP.textColor = textColor
        
        let labelT = UILabel()
        labelT.frame = CGRect(x: 65, y: 239, width: 448, height: 72)
        labelT.text = "Você descobriu todos os objetos desse cenário"
        labelT.numberOfLines = 2
        labelT.font = UIFont(name: "SFProRounded-Regular", size: 28)
        labelT.textAlignment = .center
        labelT.textColor = textColor
        
        let btn = UIButton()
        btn.frame = CGRect(x: 130, y: 370, width: 310, height: 46)
        btn.setTitle("EXPLORAR OUTRO CENÁRIO", for: .normal)
        btn.setBackgroundImage(UIImage(named: "bgBtnP.png"), for: .normal)
        view.isUserInteractionEnabled = true
        
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        
        let card = UIImageView(image: cardbg)
        card.frame = CGRect(x: 431, y: 211, width: 583, height: 479)
        card.addSubview(labelP)
        card.addSubview(labelT)
        card.addSubview(btn)
        card.isUserInteractionEnabled = true
        
        view.addSubview(card)
        
        return view
    }
    
    @objc func tapBtn(){
        print("toque")
        navigationController?.pushViewController(spaceViewController, animated: true)
    }
    
}


public class FinalSpaceViewController : UIViewController{
    
    public override func loadView() {
        
        let view = UIView()
        
        var cardView = UIImageView()
        
        let img = UIImage(named: "backgroundSpace.png")!
        let cardbg = UIImage(named: "backParabensSpace.png")!
        
        cardView = createView(imgbg: img, textColor: .white, cardbg: cardbg)
        
        
        view.addSubview(cardView)
        
        self.view = view
    }
    
    public func createView(imgbg:UIImage, textColor:UIColor, cardbg:UIImage) -> UIImageView{
        let view = UIImageView(image: imgbg)
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.backgroundColor = .white
        
        let labelP = UILabel()
        labelP.frame = CGRect(x: 130, y: 122, width: 350, height: 68)
        labelP.text = "PARABÉNS"
        labelP.font = UIFont(name: "SFProText-Bold", size: 59)
        labelP.textAlignment = .center
        labelP.textColor = textColor
        
        let labelT = UILabel()
        labelT.frame = CGRect(x: 65, y: 239, width: 448, height: 72)
        labelT.text = "Você descobriu todos os objetos desse cenário"
        labelT.numberOfLines = 2
        labelT.font = UIFont(name: "SFProRounded-Regular", size: 28)
        labelT.textAlignment = .center
        labelT.textColor = textColor
        
        let btn = UIButton()
        btn.frame = CGRect(x: 130, y: 370, width: 310, height: 46)
        btn.setTitle("EXPLORAR OUTRO CENÁRIO", for: .normal)
        btn.setBackgroundImage(UIImage(named: "bgBtnP.png"), for: .normal)
        view.isUserInteractionEnabled = true
        
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        
        let card = UIImageView(image: cardbg)
        card.frame = CGRect(x: 431, y: 211, width: 583, height: 479)
        card.addSubview(labelP)
        card.addSubview(labelT)
        card.addSubview(btn)
        card.isUserInteractionEnabled = true
        
        view.addSubview(card)
        
        return view
    }
    
    @objc func tapBtn(){
        navigationController?.popToViewController(laboratoryViewController, animated: true)
    }
}

func createCard(content:Mulher, frame:CGRect) -> UIImageView{
    let view = UIImageView(image: content.getImagem())
    view.frame = frame
    
    
    let label = UILabel(frame: CGRect(x: 189, y: 25, width: 279, height: 27))
    label.text = "Você descobriu"
    label.textAlignment = .center
    label.font = UIFont(name: "SFProRounded-Regular", size: 20)
    label.textColor = .grayTextColor
    
    view.addSubview(label)
    
    let labelNome = UILabel(frame: CGRect(x: 190, y: 52, width: 279, height: 42))
    labelNome.text = content.getNome()
    labelNome.textAlignment = .center
    labelNome.font = UIFont(name: "SFProRounded-Bold", size: 28)
    labelNome.textColor = .grayTextColor
    
    view.addSubview(labelNome)
    
    let text = UITextView(frame: CGRect(x: 195, y: 111, width: 261, height: 263))
    text.text = content.getDescricao()
    text.textAlignment = .natural
    text.font = UIFont(name: "SFProText-Regular", size: 16)
    
    text.textColor = .grayTextColor
    text.backgroundColor = .cinzaBackground
    
    view.addSubview(text)
    
    let btnLabel = UILabel(frame: CGRect(x: 356, y: 398, width: 83, height: 18))
    btnLabel.text = "CONTINUAR"
    btnLabel.textAlignment = .center
    btnLabel.textColor = .white
    btnLabel.font = UIFont(name: "SFMono-Regular", size: 15)
    
    view.isUserInteractionEnabled = true
    
    
    return view
    
}


func createButtonPreview() -> UIButton{
    let btnPreview = UIButton()
    let image = UIImage(named: "btnPreview.png")
    
    btnPreview.frame = CGRect(x: 74, y: 425, width: 33, height: 52)
    btnPreview.setImage(image, for: .normal)
    return btnPreview
}

func createButtonNext() -> UIButton{
    let btnNext = UIButton()
    let image = UIImage(named: "btnNext.png")
    btnNext.frame = CGRect(x: 1333, y: 425, width: 33, height: 52)
    btnNext.setImage(image, for: .normal)
    return btnNext
}

func createTextView(text:String) -> UITextView{
    let textView = UITextView()
    textView.frame = CGRect(x: 455, y: 364, width: 530, height: 200)
    textView.text = text
    textView.textAlignment = .center
    textView.font = UIFont(name: "SFProtext-Regular", size: 32)
    textView.textColor = .white
    textView.backgroundColor = .roxoBackground
    
    return textView
}

let myViewController = MyViewController()
let mySecondViewController = MySecondViewController()
let myThirdViewController = MyThirdViewController()
let laboratoryViewController = LaboratoryViewController()
//let cardViewController = CardViewController(screenType: .mac, isPortrait: true)
//cardViewController.scale(to:0.5)
let rosalindViewController = RosalindViewController()
let marieViewController = MarieViewController()
let francoiseViewController = FrancoiseViewController()
let spaceViewController = SpaceViewController()
let jocellynViewController = JocellynViewController()
let margaretViewController = MargaretViewController()
let katieViewController = KatieViewController()
let finalLabViewController = FinalLabViewController()
let finalSpaceViewController = FinalSpaceViewController()



let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(myViewController, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)

//let vc = MyViewController(screenType: .mac, isPortrait: true)
//PlaygroundPage.current.liveView = vc.scale(to: 0.4)
