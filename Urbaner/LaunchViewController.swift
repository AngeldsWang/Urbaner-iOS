//
//  LaunchViewController.swift
//  Urbaner
//
//  Created by wang-zhenjun on 2017/05/14.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {
    
    var player: AVPlayer?
    
    @IBOutlet weak var launchBgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UrbanLabel!
    @IBOutlet weak var descLabel: UrbanLabel!
    @IBOutlet weak var loginLabel: UrbanLabel!
    @IBOutlet weak var signupLabel: UrbanLabel!
    
    let defaults = UserDefaults.standard
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginStatus = self.defaults.value(forKey: "loginStatus")

        if loginStatus != nil && (loginStatus as? Bool)! {
            self.performSegue(withIdentifier: "moveToMainFromLaunch", sender: self)
        } else {
            launchBgImageView.isHidden = true
            loadVideo()
            NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        }
    }
    
    private func loadVideo() {
        let videoURL = Bundle.main.url(forResource: "test1", withExtension: "mp4")
        player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        self.view.layer.addSublayer(playerLayer)
        
        player?.seek(to: kCMTimeZero)
        player?.play()
    }
    
    func playerDidFinishPlaying(note: NSNotification) {
        launchBgImageView.isHidden = false
        print("Video Finished")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                    object: player?.currentItem)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let segue = DismissSlideHorSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    
    @IBAction func unwindToLaunchScreen(segue:UIStoryboardSegue) { }

}









