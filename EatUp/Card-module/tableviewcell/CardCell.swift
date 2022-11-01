//
//  CardCell.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import UIKit

class CardCell: UITableViewCell {

    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodCount: UILabel!
    
    var cart: FoodsDetail?
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
    }

    
    
}
