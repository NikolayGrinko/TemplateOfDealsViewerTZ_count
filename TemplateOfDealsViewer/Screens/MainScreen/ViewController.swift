import UIKit

class ViewController: UIViewController {
	
	let deal = DealCell()
	//private let server = Server()
	private var models: [Model] = []
	
	private let tableView = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Deals"
		view.addSubview(tableView)
		tableView.frame = view.bounds
		
		tableView.register(UINib(nibName: DealCell.reuseIidentifier, bundle: nil), forCellReuseIdentifier: DealCell.reuseIidentifier)
		tableView.register(UINib(nibName: HeaderCell.reuseIidentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderCell.reuseIidentifier)
		tableView.dataSource = self
		tableView.delegate = self
		
		//implementationOfTransactions()
		loadingContent()
	}
	
	private func loadingContent() {
		
		guard let path = Bundle.main.path(forResource: "JsonTZ", ofType: "geojson") else { return }
		let url = URL(fileURLWithPath: path)
		do {
			let data = try! Data(contentsOf: url)
			let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
			
			models = try! JSONDecoder().decode([Model].self, from: data)
			//print(json)
		}
		catch {
			print(error)
		}
	}
	
	// removed "server.subscribeToDeals" so as not to overload "viewDidLoad"
	//	private func implementationOfTransactions() {
	//		server.subscribeToDeals { deals in
	//		  self.model.append(contentsOf: deals)
	//		  self.tableView.reloadData()
	//		}
	//	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//1
		models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: DealCell.reuseIidentifier, for: indexPath) as! DealCell
		cell.configure(for: models[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIidentifier) as! HeaderCell
		return cell
	}
	//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
	//    return 60
	//  }
}
