//
//  ViewController.swift
//  PullToRefresh
//
//  Created by marco rodriguez on 22/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaEjemplo: UITableView!
    private var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaEjemplo.delegate = self
        tablaEjemplo.dataSource = self
        
        fetchData()
        tablaEjemplo.refreshControl = UIRefreshControl()
        tablaEjemplo.refreshControl?.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
    }
    
    @objc func didPullRefresh() {
        //Refresh
        print("Start refresh")
        DispatchQueue.main.async {
            self.tablaEjemplo.refreshControl?.endRefreshing()
        }
    }
    
    private func fetchData(){
    
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0") else { return }
    
        let tarea = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, _, error in
            guard let strongSelf = self, let data = data, error == nil else { return }
        
            var result: APIResponse?
            do {
                result = try JSONDecoder().decode(APIResponse.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
            
            guard let finalData = result else { return }
            
            strongSelf.tableData.append("Sunrise: \(finalData.results.sunrise)")
            strongSelf.tableData.append("Sunset: \(finalData.results.sunset)")
            strongSelf.tableData.append("Day Length: \(finalData.results.day_length)")
            
            DispatchQueue.main.async {
                strongSelf.tablaEjemplo.reloadData()
            }
            
        
    })
        tarea.resume()

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaEjemplo.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = tableData[indexPath.row]
        return celda
    }
    
    
}

