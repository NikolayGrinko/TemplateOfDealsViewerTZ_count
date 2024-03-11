import UIKit

class DealCell: UITableViewCell {
  
  static let reuseIidentifier = "DealCell"
  
  private let models: [Model] = []
	
  @IBOutlet weak var instrumentNameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var sideLabel: UILabel!
  @IBOutlet weak var dataLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	func configure(for viewModel: Model) {
		
		instrumentNameLabel.text = "\(viewModel.instrumentName)"
		priceLabel.text = "\(viewModel.price)"
		amountLabel.text = "\(viewModel.amount)"
		sideLabel.text = viewModel.side.buy
		//sideLabel.text = viewModel.side.sell
		dataLabel.text = viewModel.dateModifier
	 }
}
