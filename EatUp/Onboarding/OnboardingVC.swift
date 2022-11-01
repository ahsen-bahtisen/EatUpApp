//
//  OnboardingVC.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 19.10.2022.
//

import UIKit
import Lottie

class OnboardingVC: UIViewController {

    
    
    @IBOutlet weak var buttonIleri: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var CollectionViewOnboard: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                buttonIleri.setTitle("Hadi Başlayalım", for: .normal)
            }else{
                buttonIleri.setTitle("İlerle", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        slides = [ OnboardingSlide(title: "Lezzetli Yemekler", description: "Dünyanın farklı kültürlerinden çeşitli harika yemekleri deneyimleyin.", animationName: "90016-order-food"), OnboardingSlide(title: "Birinci Sınıf Şefler", description: "Yemeklerimiz sadece en iyiler tarafından hazırlanır.", animationName: "31454-food-prepared-food-app"), OnboardingSlide(title: "Hızlı Ve Sıcak Teslimat", description: "Siparişleriniz konumunuzdan bağımsız olarak anında teslim edilecektir.", animationName: "113313-local-delivery") ]
        
  
    }

    @IBAction func buttonIleriClick(_ sender: Any) {
        if currentPage == slides.count - 1{
            let conroller = storyboard?.instantiateViewController(withIdentifier: "HomePageee") as! UINavigationController
            conroller.modalPresentationStyle = .fullScreen
            conroller.modalTransitionStyle = .flipHorizontal
            present(conroller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionViewOnboard.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
}
