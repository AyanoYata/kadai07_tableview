
import UIKit

class LadyBookTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
/*【Cellファイル・必至】
Xib上でCellを選択し、Attributes Inspectorで「Identifier」の名前を設定しCellを使えるようにする*/
