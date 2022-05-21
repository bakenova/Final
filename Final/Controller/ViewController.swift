//
//  ViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
import AVKit
import AVFoundation
 
class ViewController: UIViewController {
    
    var player: AVPlayer?
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        loadVideo()
    }
 
    private func loadVideo() {
 
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch { }
 
        let path = Bundle.main.path(forResource: "video5206550645464635064", ofType:"mp4")
 
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        let playerLayer = AVPlayerLayer(player: player)
 
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.zPosition = -1
 
        self.view.layer.addSublayer(playerLayer)
 
        player?.seek(to: CMTime.zero)
        player?.play()
        
        
    }
 
    func openPressed() {
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                
        mainVC.modalPresentationStyle = .overFullScreen
        
        present(mainVC, animated: true, completion: nil)
    }
}
