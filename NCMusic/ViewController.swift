//
//  ViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/8/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clickbtn(_ sender: Any) {
        let vc = NCRecommendSongsViewController.init(style: .plain)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

