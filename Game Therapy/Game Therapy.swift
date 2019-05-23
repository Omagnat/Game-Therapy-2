//
//  Game Therapy.swift
//  Game Therapy
//
//  Created by Caliendo Gianluca on 20/05/2019.
//  Copyright © 2019 iOSFoundation. All rights reserved.
//

import UIKit
import AVFoundation

class GameTherapy: UIViewController {

    @IBOutlet weak var soundState: UIButton!
    
    var audioPlayer = AVAudioPlayer()

    @IBAction func audioTrigger(_ sender: UIButton) {
        if audioPlayer.volume != 0.0 {
        soundState.setImage(UIImage(named: "muto.png"), for: .normal)
        audioPlayer.volume = 0.0
        }
        else {
            soundState.setImage(UIImage(named: "volume"), for: .normal)
            audioPlayer.volume = 0.5
        }
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setNavigationBarHidden(true, animated: true)
    backgrund()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func backgrund() {
        
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "background", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch {
            
        }
        
        audioPlayer.play()
        audioPlayer.numberOfLoops = 999999999999999999
        }

}
