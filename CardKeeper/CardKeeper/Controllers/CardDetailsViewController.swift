//
//  CardDetailsViewController.swift
//  CardKeeper
//
//  Created by Nata Boiko on 24.05.2021.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    public var selectedCard: Card!
    
    //MARK: - Subviews
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let cardLabel: UILabel = {
        let cardLabel = UILabel()
        cardLabel.layer.masksToBounds = true
        cardLabel.layer.cornerRadius = 12
        return cardLabel
    }()
    
    private let bankLabel: UILabel = {
        let bankLabel = UILabel()
        bankLabel.text = "Bank"
        bankLabel.textColor = .white
        bankLabel.font = .systemFont(ofSize: 30, weight: .medium)
        return bankLabel
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.textColor = .systemGray
        numberLabel.font = .systemFont(ofSize: 30, weight: .medium)
        return numberLabel
    }()
    
    private let bankLogo: UIImageView = {
        let bankLogo = UIImageView()
        bankLogo.backgroundColor = .clear
        bankLogo.contentMode = .scaleAspectFit
        return bankLogo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addSubview(cardLabel)
        cardLabel.addSubview(bankLabel)
        cardLabel.addSubview(stackView)
        stackView.addSubview(numberLabel)
        stackView.addSubview(bankLogo)
        
        cardLabel.backgroundColor = UIColor(hex: selectedCard.color!)
        numberLabel.text = selectedCard.number
        bankLogo.image = UIImage(data: selectedCard.bankLogo!)
        
        setupUI()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 400, height: 600)
    }
    
    //MARK: - Auto Layout
    func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.widthAnchor.constraint(equalToConstant: 360).isActive = true
        cardLabel.heightAnchor.constraint(equalToConstant: 240).isActive = true
        cardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200).isActive = true
        
        bankLabel.translatesAutoresizingMaskIntoConstraints = false
        bankLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bankLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bankLabel.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor, constant: 20).isActive = true
        bankLabel.topAnchor.constraint(lessThanOrEqualTo: cardLabel.topAnchor, constant: 60).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: cardLabel.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: cardLabel.topAnchor, constant: 140).isActive = true
        
        bankLogo.translatesAutoresizingMaskIntoConstraints = false
        bankLogo.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        bankLogo.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bankLogo.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -120).isActive = true
        numberLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
        numberLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -40).isActive = true
    }
}
