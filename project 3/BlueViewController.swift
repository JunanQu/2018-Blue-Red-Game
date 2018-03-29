//
//  BlueViewController.swift
//  project 3
//
//  Created by Junan Qu on 3/18/18.
//  Copyright © 2018 Junan Qu. All rights reserved.
//

import UIKit

protocol BlueSaveButtonDelegate {
    func blueSaveButtonPressed(withName name: String)
}

class BlueCircleArenaViewController: UIViewController {
    
    var dismissButton: UIButton!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var blueSaveButton: UIButton!
    
    var delegate: BlueSaveButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        dismissButton = UIButton()
        dismissButton.setTitle("Back", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        dismissButton.setTitleColor(.blue, for: .normal)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        nameLabel.text = "Name: "
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField = UITextField()
        nameTextField.textColor = .black
        nameTextField.returnKeyType = .done
        nameTextField.text = "Blue Circle Arena"
        nameTextField.layer.cornerRadius = 5
        nameTextField.backgroundColor = UIColor(red: 21/255, green: 105/255, blue:232/255, alpha:1)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        blueSaveButton = UIButton()
        blueSaveButton.setTitle("Save", for: .normal)
        blueSaveButton.addTarget(self, action: #selector(blueSaveButtonPressed), for: .touchUpInside)
        blueSaveButton.setTitleColor(.blue, for: .normal)
        blueSaveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dismissButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(blueSaveButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48)
            ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        NSLayoutConstraint.activate([
            blueSaveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            blueSaveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = (touch ).location(in: view)
            let circle = UIView(frame: CGRect(x: location.x, y: location.y, width: 20, height: 20))
            circle.layer.cornerRadius = 10
            circle.backgroundColor = UIColor(red: 21/255, green: 105/255, blue:232/255, alpha:1)
            self.view.addSubview(circle)
        }}
    @objc func dismissButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @objc func blueSaveButtonPressed(sender: UIButton) {
        if let name = nameTextField.text {
            if (name=="") {
                let alert = UIAlertController(title: "Invalid Name", message: "The button's name cannot be empty!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler:nil))
                self.present(alert, animated:true)
            }
            else {
                delegate?.blueSaveButtonPressed(withName: name)
                dismissButtonPressed(sender: dismissButton)
            }}}
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


