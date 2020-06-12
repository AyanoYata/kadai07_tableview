import UIKit

class DetailViewController: UIViewController {

    
    var LadysInfo: LadysInfo?
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // LadysInfoをアンラップ
    guard let LadysInfo = LadysInfo else { return }
    // 遷移元から引き継がれた値をUIに反映
    iconView.image = UIImage(named: LadysInfo.iconName)
    titleLabel.text = LadysInfo.title
    descriptionLabel.text = LadysInfo.description
   
}
