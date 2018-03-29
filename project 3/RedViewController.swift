//
//  RedViewController.swift
//  project 3
//
//  Created by Junan Qu on 3/18/18.
//  Copyright © 2018 Junan Qu. All rights reserved.
//

import UIKit

protocol RedSaveButtonDelegate {
    func redSaveButtonPressed(withName name: String)
}

class RedSquareArenaViewController: UIViewController {
    
    
    var nameLabel:UILabel!
    var nameTextField:UITextField!
    var redSaveButton:UIButton!
    
    var delegate: RedSaveButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.text = "Name: "
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField = UITextField()
        nameTextField.textColor = .black
        nameTextField.returnKeyType = .done
        nameTextField.text = "Red Square Arena"
        nameTextField.layer.cornerRadius = 5
        nameTextField.backgroundColor = UIColor(red: 255/255, green: 57/255, blue:0/255, alpha:1)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        redSaveButton = UIButton()
        redSaveButton.setTitle("Save", for: .normal)
        redSaveButton.addTarget(self, action: #selector(redSaveButtonPressed), for: .touchUpInside)
        redSaveButton.setTitleColor(.blue, for: .normal)
        redSaveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(redSaveButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48)
            ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        NSLayoutConstraint.activate([
            redSaveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            redSaveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = (touch ).location(in: view)
            let square = UIView(frame: CGRect(x: location.x, y: location.y, width: 20, height: 20))
            square.backgroundColor = UIColor(red: 255/255, green: 57/255, blue:0/255, alpha:1)
            self.view.addSubview(square)
        }
    }
    
    @objc func redSaveButtonPressed(sender: UIButton) {
        if let name = nameTextField.text {
            if (name=="") {
                let alert = UIAlertController(title: "Invalid Name", message: "The button's name cannot be empty!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler:nil))
                self.present(alert, animated:true)
            }
            else {
                delegate?.redSaveButtonPressed(withName: name)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

