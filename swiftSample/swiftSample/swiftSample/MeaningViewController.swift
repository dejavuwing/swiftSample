//
//  MeaningViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 5..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit


class MeaningViewController: UIViewController {
    
    var selectedWord: jakesWord!
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meanTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordLabel.text = selectedWord.word
        meanTextView.text = selectedWord.means_en.stringByReplacingOccurrencesOfString("\\n", withString: "\r\r")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
