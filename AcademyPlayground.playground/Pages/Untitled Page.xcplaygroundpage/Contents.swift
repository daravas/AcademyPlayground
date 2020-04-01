//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//cria nova fonte
let cfURL = Bundle.main.url(forResource: "SF-Pro-Text-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

//cria cor de fundo
//let backgroundImage =  UIImage(imageLiteralResourceName: "background.png")
//et backgroundColor = UIColor(patternImage: backgroundImage) cria cor a partir de uma imagem
//let background = UIImageView(image: backgroundImage)

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .roxoBackground
        
        let textView = createTextView()
        
        view.addSubview(textView)
        
        let btnNext = createButtonNext()
        view.addSubview(btnNext)
        
        //view.addSubview(viewBook)
        self.view = view
    }
    
   
}

func createButtonNext() -> UIButton{
    let btnNext = UIButton()
    let image = UIImage(named: "btnNext.png")
    btnNext.frame = CGRect(x: 1333, y: 425, width: 33, height: 52)
    btnNext.setImage(image, for: .normal)
    return btnNext
}

func createTextView() -> UITextView{
    let textView = UITextView()
    textView.frame = CGRect(x: 455, y: 364, width: 530, height: 200)
    textView.text = " O playground Nome te mostra as descobertas e histórias das mulheres da ciência, tecnologia,engenharia e matemática"
    textView.textAlignment = .center
    textView.font = UIFont(name: "SF Pro text", size: 32)
    textView.textColor = .white
    textView.backgroundColor = .roxoBackground
    
    return textView
}

let vc = MyViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = vc.scale(to: 0.4)
