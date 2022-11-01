//
//  HomePage.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 26.10.2022.
//

import UIKit
import Alamofire
import Kingfisher
import Firebase

class HomePage: UIViewController {

    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var foodList = [Foods]()
    var filterFood = [Foods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        searchBar.delegate = self
        HomePageRouter.createModule(ref: self)
        
   
    }
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.getFoods()
        homePagePresenterObject?.fetchFoodsAtCart()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "FoodDetail" {
               let food = sender as? Foods
               let destinationVC = segue.destination as! FoodDetailVC
               destinationVC.food = food
        }
    }
}
extension HomePage: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = filterFood[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! HomePageTableViewCell
        cell.foodNameLabel.text = food.yemek_adi!
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!).00 ₺"
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)")
                {
                    DispatchQueue.main.async {
                        cell.foodImageView.kf.setImage(with : url)
                    }
                }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterFood.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = filterFood[indexPath.row]
        performSegue(withIdentifier: "FoodDetail", sender: food)
    }
}

extension HomePage : PresenterToViewHomePageProtocol {
    
    func sendDataToView(foodsAtCart: Int) {
        
        self.tabBarController?.tabBar.items![1].badgeValue = "\(foodsAtCart)"
        self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "PrimaryColor2")
        
        }
    
        func sendDataToView(foods: Array<Foods>) {
            self.foodList = foods
            self.filterFood = foods
            DispatchQueue.main.async {
                self.foodTableView.reloadData()
            }
        }
}

extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterFood = self.foodList.filter { filter in
            if filter.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.foodTableView.reloadData()
    }
}
