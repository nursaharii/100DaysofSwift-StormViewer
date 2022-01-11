//
//  ViewController.swift
//  StormViewer
//
//  Created by Nurşah on 11.01.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pic[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    var pic = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        tableView.delegate = self
        tableView.dataSource = self
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                pic.append(item)
            }
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detail = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsViewController {
            detail.selectedIndex = indexPath.row
            detail.Images = pic
            navigationController?.pushViewController(detail, animated: true)
        }
    }
}

