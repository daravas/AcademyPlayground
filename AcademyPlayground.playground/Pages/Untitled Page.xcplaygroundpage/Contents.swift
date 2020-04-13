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
        let textViewText = " O playground Nome te mostra as descobertas e histórias das mulheres da ciência, tecnologia,engenharia e matemática"
        let textView = createTextView(text: textViewText)
        
        
        let btnNext = createButtonNext()
        btnNext.addTarget(nil, action: #selector(tapBtnNext), for: .touchUpInside)
        
        view.addSubview(textView)
        view.addSubview(btnNext)
        
        //view.addSubview(viewBook)
        self.view = view
    }
    
    @objc func tapBtnNext() {
        //show(secondViewController, sender: nil)
        //   present(mySecondViewController, animated: true, completion: nil)
        navigationController?.pushViewController(mySecondViewController, animated: true)
    }
    
    
}

class MySecondViewController : UIViewController{
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .roxoBackground
        let textViewText = " Encontre os objetos clicáveis dos cenários e  descubra mais sobre as mulheres, suas invenções e descobertas"
        let textView = createTextView(text: textViewText)
        
        view.addSubview(textView)
        
        let btnPreview = createButtonPreview()
        btnPreview.addTarget(nil, action: #selector(tapBtnPreview), for: .touchUpInside)
        
        view.addSubview(btnPreview)
        
        let btnNext = createButtonNext()
        btnNext.addTarget(nil, action: #selector(tapBtnNext), for: .touchUpInside)
        view.addSubview(btnNext)
        
        //view.addSubview(viewBook)
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
        let textViewText = " Você pode trocar de cenário encontrando todos os objetos de uma cena ou na opção Trocar cenário - são 2 ambientes: laboratório e oficina"
        
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
    
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        view.addSubview(createImg())
        
        
        //        let viewPc = createViewPc()
        //               viewPc.isUserInteractionEnabled = true
        //        let tapPc = UIGestureRecognizer(target: self, action: #selector(LaboratoryViewController.handleTap))
        //               viewPc.addGestureRecognizer(tapPc)
        //
        //               view.addSubview(viewPc)
        
        let btnMicroscope = createBtnMicroscope()
        btnMicroscope.addTarget(self, action: #selector(tapBtnMicroscope), for: .touchUpInside)
        
        view.addSubview(btnMicroscope)
        
        let btnPc = createBtnPc()
        btnPc.addTarget(self, action: #selector(tapBtnPc), for: .touchUpInside)
        
        view.addSubview(btnPc)
        
        let btnBoard = createBtnBoard()
        btnBoard.addTarget(self, action: #selector(tapBtnBoard), for: .touchUpInside)
        view.addSubview(btnBoard)
        
        
        //        let viewMicroscope = createViewMicroscope()
        //        viewMicroscope.isUserInteractionEnabled = true
        //        let tapMicroscope = UITapGestureRecognizer(target: self, action: #selector(handleTapMicroscope))
        //        viewMicroscope.addGestureRecognizer(tapMicroscope)
        //
        //        view.addSubview(viewMicroscope)
        
        
        
        //        let viewBoard = createViewBoard()
        //        viewBoard.isUserInteractionEnabled = true
        //        let tapBoard = UIGestureRecognizer(target: self, action: #selector(handleTapBoard))
        //        viewBoard.addGestureRecognizer(tapBoard)
        //
        //        view.addSubview(viewBoard)
        //
        
        self.view = view
    }
    
    
    @objc func tapBtnMicroscope() {
        present(francoiseViewController, animated: true)
    }
    
    @objc func tapBtnPc() {
        present(rosalindViewController, animated: true)
    }
    
    @objc func tapBtnBoard() {
        present(marieViewController, animated: true)
    }
    
    //    @objc func handleTapMicroscope(_ gesture: UIGestureRecognizer) {
    //        print("tap microscope")
    //        present(cardViewController, animated: true)
    //
    //    }
    //
    //    @objc func handleTap(_ gesture: UIGestureRecognizer) {
    //        print("tap pc")
    //           present(cardViewController, animated: true)
    //       }
    //
    //    @objc func handleTapBoard(_ gesture: UIGestureRecognizer) {
    //        present(cardViewController, animated: true)
    //    }
    //
    func createBtnMicroscope() -> UIButton{
        let image = UIImage(named: "microscope.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 591, y: 491, width: 99, height: 150)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    //    func createViewMicroscope() -> UIImageView{
    //        let image = UIImage(named: "microscope.png")
    //        let view = UIImageView(image: image)
    //
    //        view.frame = CGRect(x: 591, y: 491, width: 99, height: 150)
    //
    //        return view
    //    }
    
    func createBtnPc() -> UIButton{
        let image = UIImage(named: "pc.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 818, y: 452, width: 221, height: 188)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    //    func createViewPc() -> UIImageView{
    //        let image = UIImage(named: "pc.png")
    //        let view = UIImageView(image: image)
    //
    //        view.frame = CGRect(x: 818, y: 452, width: 221, height: 188)
    //        return view
    //    }
    
    func createBtnBoard() -> UIButton{
        let image = UIImage(named: "quadro.png")
        let btn = UIButton()
        
        btn.frame = CGRect(x: 929, y: -56, width: 626, height: 458)
        btn.setImage(image, for: .normal)
        
        return btn
    }
    
    //    func createViewBoard() -> UIImageView{
    //        let image = UIImage(named: "quadro.png")
    //        let view = UIImageView(image: image)
    //
    //        view.frame = CGRect(x: 929, y: -56, width: 626, height: 458)
    //
    //        return view
    //    }
    
    
    
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
    
    let rosalind = Mulher(nome: "ROSALIND FRANKLIN", descricao: " Rosalind Franklin realizou doutorado em Física e Química. Foi a responsável pelos estudos com cristalografia de raios-x que permitiu a descoberta da estrutura de dupla hélice do DNA.\n\n Rosalind jamais foi premiada pela sua descoberta, ficando com Watson e Crick os créditos pela descoberta da estrutura do DNA.", imagem: UIImage(named: "card_rosalind")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewPc = createViewCardPc()
        view.addSubview(viewPc)
        
        
        self.view = view
    }
    
    func createViewCardPc() -> UIView{
        let view = UIView()
        let frame = CGRect(x: 271, y: 364, width: 495, height: 456)
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewCard = createCard(content: rosalind,frame: frame )
        viewCard.addSubview(btnContinue)
        
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.backgroundColor = .darkGrayBg
        view.addSubview(viewCard)
        return view
    }
    
    @objc func tapBtnContinue() {
        dismiss(animated: true, completion: nil)
    }
}

class MarieViewController : UIViewController{
    
    let marie = Mulher(nome: "MARIE CURIE", descricao: "Considerada a Mãe Da Física Morderna, Marie Curie é mundialmente conhecida por ser pioneira em pesquisas sobre radioatividade. Além disso ela descobriu os elementos polônio e rádio e conseguiu isolar isótopos desses elementos.\n\n Ela foi a 1ª mulher a ganhar um Nobel e também a 1ª a ser laureada duas vezes com o prêmio. Em química, em 1903, e em física, em 1911. ", imagem: UIImage(named: "card_marie.png")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewBoard = createViewCardBoard()
        
        
        view.addSubview(viewBoard)
        
        
        self.view = view
    }
    
    func createViewCardBoard() -> UIView{
        let view = UIView()
        let frame = CGRect(x: 533, y: 175, width: 495, height: 456)
        
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewCard = createCard(content: marie,frame: frame )
        viewCard.addSubview(btnContinue)
        
        
        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        view.backgroundColor = .darkGrayBg
        view.addSubview(viewCard)
        return view
    }
    
    @objc func tapBtnContinue() {
        print("tap btn")
        dismiss(animated: true, completion: nil)
    }
}

class FrancoiseViewController: UIViewController{
    
    let francoise = Mulher(nome: "FRANÇOISE BARRÉ-SINOUSSI", descricao: "A virologista francesa foi a responsável por uma das descobertas mais impactantes das últimas décadas. Com o auxílio de dois colegas, Françoise descobriu o HIV, o vírus causador da AIDS, em 1983. Junto com seu mentor, Luc Montagnier, Françoise foi laureada com o Nobel de Medicina em 2008.", imagem: UIImage(named: "card_francoise.png")!)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGrayBg
        
        let viewMicroscope = createViewCardMicroscope()
        
        
        view.addSubview(viewMicroscope)
        
        
        self.view = view
    }
    
    func createViewCardMicroscope() -> UIView{
        let viewCard = UIView()
        let frame = CGRect(x: 728, y: 373, width: 495, height: 456)
        
        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
        btnContinue.setTitle("CONTINUAR", for: .normal)
        btnContinue.backgroundColor = .laranjaPrimario
        
        btnContinue.addTarget(self, action: #selector(tapBtnContinue), for: .touchUpInside)
        
        let viewMicroscope = createCard(content: francoise,frame: frame )
        viewMicroscope.addSubview(btnContinue)
        
        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        viewCard.backgroundColor = .darkGrayBg
        viewCard.addSubview(viewMicroscope)
        
        return viewCard
    }
    
    @objc func tapBtnContinue() {
        dismiss(animated: true, completion: nil)
    }
    
    
}

//class CardViewController : UIViewController{
//
//
//    let rosalind = Mulher(nome: "ROSALIND FRANKLIN", descricao: " Rosalind Franklin realizou doutorado em Física e Química. Foi a responsável pelos estudos com cristalografia de raios-x que permitiu a descoberta da estrutura de dupla hélice do DNA.\n\n Rosalind jamais foi premiada pela sua descoberta, ficando com Watson e Crick os créditos pela descoberta da estrutura do DNA.", imagem: UIImage(named: "card_rosalind")!)
//
//    let marie = Mulher(nome: "MARIE CURIE", descricao: "Considerada a Mãe Da Física Morderna, Marie Curie é mundialmente conhecida por ser pioneira em pesquisas sobre radioatividade. Além disso ela descobriu os elementos polônio e rádio e conseguiu isolar isótopos desses elementos.\n\n Ela foi a 1ª mulher a ganhar um Nobel e também a 1ª a ser laureada duas vezes com o prêmio. Em química, em 1903, e em física, em 1911. ", imagem: UIImage(named: "card_marie.png")!)
//
//    let francoise = Mulher(nome: "FRANÇOISE BARRÉ-SINOUSSI", descricao: "A virologista francesa foi a responsável por uma das descobertas mais impactantes das últimas décadas. Com o auxílio de dois colegas, Françoise descobriu o HIV, o vírus causador da AIDS, em 1983. Junto com seu mentor, Luc Montagnier, Françoise foi laureada com o Nobel de Medicina em 2008.", imagem: UIImage(named: "card_francoise.png")!)
//
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .darkGrayBg
//
//        let viewMicroscope = createViewCardMicroscope()
//        view.addSubview(viewMicroscope)
//
//
//        self.view = view
//    }
//
//    func createCard(content:Mulher, frame:CGRect) -> UIImageView{
//        let view = UIImageView(image: content.getImagem())
//        view.frame = frame
//
//
//        let label = UILabel(frame: CGRect(x: 189, y: 25, width: 279, height: 27))
//        label.text = "Você descobriu"
//        label.textAlignment = .center
//        label.font = UIFont(name: "SFProRounded-Regular", size: 20)
//        label.textColor = .grayTextColor
//
//        view.addSubview(label)
//
//        let labelNome = UILabel(frame: CGRect(x: 190, y: 52, width: 279, height: 42))
//        labelNome.text = content.getNome()
//        labelNome.textAlignment = .center
//        labelNome.font = UIFont(name: "SFProRounded-Bold", size: 28)
//        labelNome.textColor = .grayTextColor
//
//        view.addSubview(labelNome)
//
//        let text = UITextView(frame: CGRect(x: 195, y: 111, width: 261, height: 263))
//        text.text = content.getDescricao()
//        text.textAlignment = .natural
//        text.font = UIFont(name: "SFProText-Regular", size: 16)
//
//        text.textColor = .grayTextColor
//        text.backgroundColor = .cinzaBackground
//
//        view.addSubview(text)
//
//        let btnLabel = UILabel(frame: CGRect(x: 356, y: 398, width: 83, height: 18))
//        btnLabel.text = "CONTINUAR"
//        btnLabel.textAlignment = .center
//        btnLabel.textColor = .white
//        btnLabel.font = UIFont(name: "SFMono-Regular", size: 15)
//
//        view.isUserInteractionEnabled = true
//
//        let btnContinue = UIButton(frame: CGRect(x: 320, y: 380, width: 140, height: 36))
//        btnContinue.setTitle("CONTINUAR", for: .normal)
//        btnContinue.backgroundColor = .laranjaPrimario
//
//        btnContinue.addTarget(self, action: #selector(CardViewController.tapBtnContinue), for: .touchUpInside)
//
//        view.addSubview(btnContinue)
//
//
//        return view
//
//    }
//
//    @objc func tapBtnContinue() {
//        print("tap btn")
//        dismiss(animated: true, completion: nil)
//    }
//
//    func createViewCardMicroscope() -> UIView{
//        let viewCard = UIView()
//        let frame = CGRect(x: 728, y: 373, width: 495, height: 456)
//
//        viewCard.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
//        viewCard.backgroundColor = .darkGrayBg
//        viewCard.addSubview(createCard(content: francoise, frame: frame))
//
//        return viewCard
//    }
//
//    func createViewCardPc() -> UIView{
//           let view = UIView()
//          let frame = CGRect(x: 271, y: 364, width: 495, height: 456)
//
//           view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
//           view.backgroundColor = .darkGrayBg
//           view.addSubview(createCard(content: rosalind,frame: frame ))
//           return view
//       }
//
//    func createViewCardBoard() -> UIView{
//        let view = UIView()
//       let frame = CGRect(x: 533, y: 175, width: 495, height: 456)
//
//        view.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
//        view.backgroundColor = .darkGrayBg
//        view.addSubview(createCard(content: marie,frame: frame ))
//        return view
//    }
//
//
//
//
//}

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
let rosalindViewController = RosalindViewController(screenType: .mac, isPortrait: true)
rosalindViewController.scale(to:0.5)
let marieViewController = MarieViewController(screenType: .mac, isPortrait: true)
marieViewController.scale(to:0.5)
let francoiseViewController = FrancoiseViewController(screenType: .mac, isPortrait: true)
francoiseViewController.scale(to:0.5)
//cardViewController.modalPresentationStyle = .fullScreen


let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(myViewController, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)

//let vc = MyViewController(screenType: .mac, isPortrait: true)
//PlaygroundPage.current.liveView = vc.scale(to: 0.4)


