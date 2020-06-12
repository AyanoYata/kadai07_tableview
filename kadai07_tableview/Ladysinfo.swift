import Foundation
 
class LadysInfo {
    //画像の名前
    let iconName: String
    //タイトルのテキスト
    let title: String
    //descriptionのテキスト
    let description: String
    //インスタンス化するときに利用する関数(init = イニシャライズする)
    init(iconName: String, title: String, description: String) {
        self.iconName = iconName
        self.title = title
        self.description = description
    /*classは何かしらの初期値がないと、インスタンス化できない。
         この場合、iconName、title、descriptionを引数として入れて、中身を作れるようになる。*/
        
        
    }
}

