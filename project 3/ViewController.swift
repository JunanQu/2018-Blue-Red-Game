//
//  ViewController.swift
//  project 3
//
//  Created by Junan Qu on 3/18/18.
//  Copyright © 2018 Junan Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BlueSaveButtonDelegate, RedSaveButtonDelegate {
    
    
    var redSquareArenaButton: UIButton!
    var blueCircleArenaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        self.title = "Drawing Arenas"
        
        redSquareArenaButton = UIButton(type: .system)
        redSquareArenaButton.setTitle("Red Square Arena", for: .normal)
        redSquareArenaButton.setTitleColor(.black, for: .normal)
        redSquareArenaButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        redSquareArenaButton.backgroundColor = UIColor(red: 255/255, green: 57/255, blue:0/255, alpha:1)
        redSquareArenaButton.addTarget(self, action: #selector(redSquareArenaButtonPressed), for: .touchUpInside)
        redSquareArenaButton.translatesAutoresizingMaskIntoConstraints = false
        
        blueCircleArenaButton = UIButton(type: .system)
        blueCircleArenaButton.setTitle("Blue Circle Arena", for: .normal)
        blueCircleArenaButton.setTitleColor(.black, for: .normal)
        blueCircleArenaButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        blueCircleArenaButton.backgroundColor = UIColor(red: 21/255, green: 105/255, blue:232/255, alpha:1)
        blueCircleArenaButton.addTarget(self, action: #selector(blueCircleArenaButtonPressed), for: .touchUpInside)
        blueCircleArenaButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redSquareArenaButton)
        view.addSubview(blueCircleArenaButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            redSquareArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareArenaButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120)
            ])
        
        NSLayoutConstraint.activate([
            blueCircleArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircleArenaButton.topAnchor.constraint(equalTo: redSquareArenaButton.bottomAnchor, constant: 120)
            ])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func redSquareArenaButtonPressed(sender: UIButton) {
        let redVC = RedSquareArenaViewController()
        redVC.delegate = self
        navigationController?.pushViewController(redVC, animated: true)
    }
    
    @objc func blueCircleArenaButtonPressed(sender:UIButton) {
        let blueVC = BlueCircleArenaViewController()
        blueVC.delegate = self
        present(blueVC, animated: true, completion: nil)
    }
    
    func blueSaveButtonPressed (withName name: String) {
        blueCircleArenaButton.setTitle(name, for: .normal)
    }
    
    func redSaveButtonPressed(withName name: String) {
        redSquareArenaButton.setTitle(name, for: .normal)
    }
}

