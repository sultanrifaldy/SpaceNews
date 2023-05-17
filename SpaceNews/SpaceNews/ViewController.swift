//
//  ViewController.swift
//  SpaceNews
//
//  Created by Sultan Rifaldy on 16/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var loadData: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        loadLatestNews()
        
    }

    func loadLatestNews() {
        ApiServices.shared.loadNews { result in
            switch result {
            case .success(let success):
                self.loadData = success
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
                print(result)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath)
        let news = loadData[indexPath.row]
        
        cell.textLabel?.text = news.title
        
        return cell
    }
}
