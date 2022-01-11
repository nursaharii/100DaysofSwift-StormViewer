//
//  DetailsViewController.swift
//  StormViewer
//
//  Created by Nurşah on 11.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    var Images : [String]?
    var selectedIndex : Int!
    var nextImg : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButton))
        ImgLoad()
    }
    func ImgLoad (){
        title = Images?[selectedIndex]
        if let imgLoad = Images?[selectedIndex] {
            img.image = UIImage(named: imgLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func nextButton() {
        if selectedIndex == Images!.count - 1 {
            selectedIndex = 0
            ImgLoad()
        }
        else {
            selectedIndex += 1
            ImgLoad()
        }
    }
}
