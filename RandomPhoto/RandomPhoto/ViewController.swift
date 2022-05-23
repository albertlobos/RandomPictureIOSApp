//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Albert Villalobos on 3/11/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("PRESS HERE", for: .normal)
        button.setTitleColor(.green, for: .normal)
      
        return button
    }()
    
    let colors: [UIColor] = [
        .blue,
        .systemCyan,
        .red,
        .brown,
        .systemPurple
    ]
        
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(imageView)
        view.addSubview(button1)
        imageView.frame = CGRect(x : 0, y : 0, width: 300, height: 300)
        imageView.center = view.center
        // Do any additional setup after loading the view.
        
        getRandomPhoto()
        button1.addTarget(self, action: #selector (didTapButton), for: .touchUpInside)

        
    }
    

    
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        button1.setTitleColor(.blue, for: .normal)
        button1.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 70)
    }
    
    
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }


}

