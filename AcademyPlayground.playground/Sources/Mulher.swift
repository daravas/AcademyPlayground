import Foundation
import UIKit

public class Mulher{
   public var nome : String
   public var descricao : String
   public var imagem = UIImage()
    
    public init(nome:String, descricao:String, imagem: UIImage) {
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
    }
    
    public init() {
        self.nome = ""
        self.descricao = ""
        self.imagem  = UIImage()
    }
    
    public func setNome(nome:String){
        self.nome = nome
    }
    
    public func setDescricao(descricao:String){
        self.descricao = descricao
    }
    
    public func setImagem(imagem:UIImage){
        self.imagem = imagem
    }
    
    public func getNome() -> String{
        return self.nome
    }
    
    public func getDescricao() -> String{
        return self.descricao
    }
    
    public func getImagem() -> UIImage{
        return self.imagem
    }
    
    
}

