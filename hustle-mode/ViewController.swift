//
//  ViewController.swift
//  hustle-mode
//
//  Created by Ricardo Castillo on 2019-03-12.
//  Copyright © 2019 Ricardo Castillo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var DarkBlueBG: UIImageView!
    @IBOutlet weak var PowerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var OnLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        }catch let error as NSError{
            print(error.description)
            
        }
        
    }

    @IBAction func powerBtnpressed(_ sender: Any) {
        cloudHolder.isHidden = false;
        DarkBlueBG.isHidden = true;
        PowerBtn.isHidden = true;
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 250, width: 375, height: 246)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.OnLabel.isHidden = false
            
        }
        
    }
    
}

