//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//cria nova fonte
let cfURL = Bundle.main.url(forResource: "SF-Pro-Text-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


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
        
        view.addSubview(btnNext)
        
        //view.addSubview(viewBook)
        self.view = view
    }
    
    @objc func tapBtnPreview() {
        navigationController?.popViewController(animated: true)
    }
    
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
    textView.font = UIFont(name: "SF Pro text", size: 32)
    textView.textColor = .white
    textView.backgroundColor = .roxoBackground
    
    return textView
}

let myViewController = MyViewController()
let mySecondViewController = MySecondViewController()
let myThirdViewController = MyThirdViewController()

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(myViewController, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)

//let vc = MyViewController(screenType: .mac, isPortrait: true)
//PlaygroundPage.current.liveView = vc.scale(to: 0.4)
