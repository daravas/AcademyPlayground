//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "SF-Pro-Rounded-Regular", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let viewBook = UIView()
        viewBook.frame = CGRect(x: 0, y: 0, width: 386, height: 768)
        viewBook.backgroundColor = .blue

        let textView = UITextView()
        textView.frame = CGRect(x: 28, y: 55, width: 330, height: 400)
        textView.text = " O playground Nome te mostras as descobertas e histórias das mulheres da ciência, tecnologia,engenharia e matemática. \n\nEncontre os objetos clicáveis e descubra mais sobre as mulheres, suas invenções e descobertas.\n\nVocê pode ainda trocar o cenário no código abaixo - são 2 ambientes:"
        textView.textAlignment = .justified
        textView.font = UIFont(name: "SF Pro Rounded", size: 25)

        
        viewBook.addSubview(textView)
        
        view.addSubview(viewBook)
        self.view = view
    }
    
   
}

let vc = MyViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = vc.scale(to: 0.4)
