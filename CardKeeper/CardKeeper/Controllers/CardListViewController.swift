//
//  CardListViewController.swift
//  CardKeeper
//
//  Created by Nata Boiko on 24.05.2021.
//

import UIKit
import RealmSwift

class CardListViewController: UIViewController {
    
    private let cellIdentifier = "CardListTableViewCell"
    private let visaLogo = "Visa_Logo"
    private let mcLogo = "Mastercard_Logo"
    private let visaColor = "faaa13"
    private let mcColor = "222222"
    
    private let realm = try! Realm()
    private var cards: Results<Card>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadCards()
    }

    @objc private func addButtonTapped() {
        let randomInt = Int.random(in: 1000...9999)
        let randomBool = Bool.random()
        var bank = String()
        var color = String()
        if randomBool {
            bank = visaLogo
            color = visaColor
        } else {
            bank = mcLogo
            color = mcColor
        }
        guard let bankLogo = UIImage(named: bank) else { return }

        let newCard = Card()
        let dataPNGImg = NSData(data: bankLogo.pngData()!)
        newCard.bankLogo = dataPNGImg as Data
        newCard.color = color
        newCard.number = "**** **** **** \(randomInt)"
        newCard.dateCreated = Date()
        saveCards(card: newCard)
    }
    
    //MARK: - Saving and loading methods
    func saveCards(card: Card) {
        do {
            try realm.write {
                realm.add(card)
            }
        } catch {
            print("Error saving new card, \(error)")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadCards() {
        cards = realm.objects(Card.self).sorted(byKeyPath: "dateCreated", ascending: false)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - Table view data source and delegate methods
extension CardListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = cards?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CardListTableViewCell
        cell.bankLogo.image = UIImage(data: (card?.bankLogo!)!)
        cell.cardNumber.text = card?.number
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = CardDetailsViewController()
        vc.selectedCard = cards?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
