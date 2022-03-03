//
//  ViewController.swift
//  HolidayApp
//
//  Created by Marcos Avila Rodriguez on 02/03/22.
//

import UIKit
import AVFoundation
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var darkView: UIView!
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    private let notificationCenter = NotificationCenter.default
    private var appEventSuscribers = [AnyCancellable]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        observeAppEvents()
        setupPlayerIfNeeded()
        restartVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        removeAppEventsSuscribers()
        removePlayer()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = view.bounds
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupViews(){
        getStartedButton.layer.cornerRadius = 28
        getStartedButton.layer.masksToBounds = true
        darkView.backgroundColor = UIColor(white: 0.1, alpha: 0.4)
    }
    
    private func buildPlayer() -> AVPlayer? {
        guard let filePath = Bundle.main.path(forResource: "bg_video", ofType: "mp4") else { return nil }
        let url = URL(fileURLWithPath: filePath)
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        player.isMuted = false
        return player
    }
    
    private func buildPlayerLayer() -> AVPlayerLayer? {
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        return layer
    }
    
    private func playVideo() {
        player?.play()
    }
    
    private func restartVideo() {
        player?.seek(to: .zero)
        playVideo()
    }
    
    private func pauseVideo() {
        player?.pause()
    }
    
    private func setupPlayerIfNeeded(){
        player = buildPlayer()
        playerLayer = buildPlayerLayer()
        
        if let layer = self.playerLayer {
            if view.layer.sublayers?.contains(layer) == false {
            view.layer.insertSublayer(layer, at: 0)
            }
        }
        
    }
    
    private func observeAppEvents() {
        notificationCenter.publisher(for: .AVPlayerItemDidPlayToEndTime).sink {[weak self] _ in
            self?.restartVideo()
        }.store(in: &appEventSuscribers)
        
        notificationCenter.publisher(for: UIApplication.willResignActiveNotification).sink { [weak self] _ in
            self?.pauseVideo()
        }.store(in: &appEventSuscribers)
        
        notificationCenter.publisher(for: UIApplication.didBecomeActiveNotification).sink { [weak self] _ in
            self?.playVideo()
        }.store(in: &appEventSuscribers)
    }
    
    private func removeAppEventsSuscribers() {
        appEventSuscribers.forEach({ subscriber in
            subscriber.cancel()
        })
    }
    
    private func removePlayer() {
        player?.pause()
        player = nil
        
        playerLayer?.removeFromSuperlayer()
        playerLayer = nil
    }
}

