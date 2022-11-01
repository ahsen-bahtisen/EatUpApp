//
//  Cart.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import UIKit
import Alamofire
import Kingfisher
import Firebase

class Cart: UIViewController {


    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var deletebutton: UIButton!
    @IBOutlet weak var placeholderb: UIButton!
    @IBOutlet weak var emptyCart: UILabel!
    
    
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var cartFoods = [FoodsDetail]()
    var foodsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTableView.delegate = self
        cardTableView.dataSource = self
        
        CartRouter.createModule(ref: self)
        
        hiddenUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getAllCart()
        cartPresenterObject?.getCount()
        
    }
    
    

    @IBAction func placeOrderButton(_ sender: Any) {
        
        if foodsCount != 0{
        let alert = UIAlertController(title: "Sipariş", message: "Siparişiniz alındı.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
            self.performSegue(withIdentifier: "finalVC", sender: nil)}
        alert.addAction(OKAction)
        self.present(alert, animated: true)
        self.cartPresenterObject?.deleteAlltems(carts: cartFoods)
        self.cardTableView.reloadData()
        self.cardTableView.dataSource = nil
        totalPriceLabel.text = "0.00 ₺"
        }else{
            let alert = UIAlertController(title: "Sepet Boş", message: "Sipariş vermek için ürün ekleyiniz.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                self.performSegue(withIdentifier: "toAnasayfa", sender: nil)}
            alert.addAction(OKAction)
            self.present(alert, animated: true)
        }
        
    }
    
    @IBAction func deleteAllItems(_ sender: Any) {
        self.cartPresenterObject?.deleteAlltems(carts: cartFoods)
        self.cardTableView.reloadData()
        self.cardTableView.dataSource = nil
        totalPriceLabel.text = "0.00 ₺"
        self.performSegue(withIdentifier: "toAnasayfa", sender: nil)
        hiddenUI()
    }
    
    func hiddenUI()
    {
        emptyCart.isHidden = false
    }
    
    func notHiddenUI()
    {
        emptyCart.isHidden = true
    }
}

extension Cart : PresenterToViewCartProtocol {
    func sendDataToView(cartList: Array<FoodsDetail>) {
        self.cartFoods = cartList
        DispatchQueue.main.async {
            self.cardTableView.reloadData()
            var total = 0
            self.cartFoods.forEach { cart_food in
                total = total + (Int(cart_food.yemek_fiyat ?? "0")! * Int(cart_food.yemek_siparis_adet ?? "0")!)
            }
            self.totalPriceLabel.text = "\(total).00 ₺"
        }
    }
    func sendDataToView(foodCount: Int) {
        self.foodsCount = foodCount
        DispatchQueue.main.async {
            self.cardTableView.reloadData()
            self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
            self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "PrimaryColor2")
            if self.foodsCount >= 1
            {
                
                self.notHiddenUI()
            }
            
        }
    }
}


extension Cart : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartFood = cartFoods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.foodNameLabel.text = cartFood.yemek_adi!
        cell.foodPriceLabel.text = "\(Int(cartFood.yemek_fiyat!)!).00 ₺"
        cell.foodCount.text = cartFood.yemek_siparis_adet
        cell.foodCount.text = "\(cartFood.yemek_siparis_adet!) adet"
        cell.cart = cartFood
        cell.totalLabel = totalPriceLabel
        cell.cartPresenterObject = cartPresenterObject
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(cartFood.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.foodImageView.kf.setImage(with: url)
                
            }
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction,view,bool) in
                let cart = self.cartFoods[indexPath.row]
                self.cartFoods.remove(at: indexPath.row)
                self.cartPresenterObject?.deleteSingleItem(cart: cart, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
                self.foodsCount -= 1
                self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
                tableView.reloadData()
                  
                    if self.foodsCount == 0 {
                        self.tabBarController?.tabBar.items![1].badgeValue = nil
                        self.totalPriceLabel.text = "0.00₺"
                        self.hiddenUI()
                   }
                    print(self.foodsCount)
                }
                return UISwipeActionsConfiguration(actions: [deleteAction])
            }
}
