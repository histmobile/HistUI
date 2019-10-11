//
//  DetailViewController.swift
//  Demo
//
//  Created by Paolo Cuscela on 03/11/17.
//  Copyright © 2017 Paolo Cuscela. All rights reserved.
//

import UIKit
import HistUIKit

class CardContentViewController: UIViewController, CircularCarouselDelegate {
    
    let colors = [
        
        UIColor.red,
        UIColor.yellow,
        UIColor.blue,
        UIColor.green,
        UIColor.brown,
        UIColor.purple,
        UIColor.orange
        
    ]
    weak var _carousel : CircularCarousel!
    @IBOutlet weak var carousel: CircularCarousel! {
        set {
            _carousel = newValue
            _carousel.delegate = self
            _carousel.dataSource = self
        }
        
        get {
            return _carousel
        }
    }
    
    override func viewDidLoad() {
        print("Loaded!")
    }
    
    @IBAction func doMagic(_ sender: Any) {
        
        view.backgroundColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        
        
    }
   
}

extension CardContentViewController: CircularCarouselDataSource {
    func carousel(_: CircularCarousel, viewForItemAt indexPath: IndexPath, reuseView view: UIView?) -> UIView {
        let label = UILabel()
        label.text = "Test \(indexPath.row)!~"
        label.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 380, height: 380))
        return label;
    }
    
    func numberOfItems(inCarousel carousel: CircularCarousel) -> Int {
        return 4
    }
}
