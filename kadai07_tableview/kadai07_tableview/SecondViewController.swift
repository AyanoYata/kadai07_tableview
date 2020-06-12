import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Cellに表示する情報の配列
       let infoLists: [LadysInfo] = [
           LadysInfo(iconName: "Lady01", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "Lady04", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "Lady03", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "CHANEL02", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "Lady08", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "Lady07", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "cafe", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "woman", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "cosme", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "flower_ Highheels", title: "Sample", description: "〇〇〇〇"),
           LadysInfo(iconName: "Lady05", title: "Sample", description: "〇〇〇〇")
       ]

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*以下、TableViewCellを作る時には、必ず必要なコード
                configure 〜 tableView.registerまで*/
                 //② ↓
               configureTableViewCell()
               
               /*④delegateをプロトコルに追加したら、どこで処理をするのか
                viewDidLoadの中に記載する必要がある*/
               tableView.delegate = self
               tableView.dataSource = self
    }
    
    // ① ↓
       //TableViewを読み込む関数
       func configureTableViewCell(){
           /*TableViewCellのクラス名を指定して、Nibを作成
            Nib = ビルドした後のXibのこと*/
           let nib = UINib(nibName: "LadyBookTableViewCell", bundle: nil)
           // Xibに設定したidentifier
           let cellID = "LadyBookTableViewCell"
           // TableViewで使えるように登録する
           //Cellにcellのidentifierを指定して登録
           tableView.register(nib, forCellReuseIdentifier: cellID)
       }
       
       // ★自動で追加されたfunc ↓
       /*classの書き方の定説はプロパティ、メソッド(func)の順番である。★のfuncは自動でclass直下に追加されるので、キレイなコードの書き方として下方に移動させた*/
       // -> Int(矢印の後のInt関数は、返り値を持つ関数。なので、return 〇〇と書く。
       //Rowsの数を指定するメソッド
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           //infoListの数を設定する。
           return infoLists.count//(ここには、上のinfoLists分、10この画像データが入っている)
       }
       
       /*tableViewのCellに表示する内容を返すメソッド
       IndexPathの数だけ、何回も呼び出されている。rowには0〜10番目までの画像が入っている*/
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LadyBookTableViewCell", for: indexPath) as! LadyBookTableViewCell
            print(indexPath)//IndexPathが何回呼び出されたかの確認用
            /* iconViewの設定      infoListsの配列[]の中から何番目の画像を取ってくるか指定
            ex) 0番目のiconの場合、0番iconNameからUIImageが作られ、cellのImageViewの画像に入っていく*/
           cell.iconView.image = UIImage(named: infoLists[indexPath.row].iconName)
           // titleの設定
           cell.titleLabel.text = infoLists[indexPath.row].title
           // descriptionの設定
           cell.descriptionLabel.text = infoLists[indexPath.row].description
           
           return cell
       }
    
    
    // sectionの数を返すDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // sectionの数を返すメソッド
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "Section\(section)"
       }
    // tableViewのCellの高さを返すメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
  
    // tableViewのCellがタップされた時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt:", indexPath)
        let vc = DetailViewController()
        // タップされたLadysInfoを遷移先のvcへ引き継ぐ
        vc.LadysInfo = infoLists[indexPath.row]
        // 画面遷移
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}
/*【単語の意味】
・Rows 行
・InSection　断面
*/
