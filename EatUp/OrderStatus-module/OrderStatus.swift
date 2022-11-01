//
//  OrderStatus.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import UIKit
import MapKit
import CoreLocation
import UserNotifications

class OrderStatus: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var izinKontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        locationManager.delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (garanted, error) in
            self.izinKontrol = garanted
        } )
        
        UNUserNotificationCenter.current().delegate = self
        
    }
    
    @IBAction func homePageButton(_ sender: Any) {
        
        if izinKontrol{
           let icerik = UNMutableNotificationContent()
            icerik.title = "Eat UP"
            icerik.subtitle = "Sipatişiniz teslim edilmiştir."
            icerik.body = "Yeni lezzetler için yine bekleriz."
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi)
        }
        
        performSegue(withIdentifier: "toanasayfa", sender: nil)

    }


}
extension OrderStatus: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations[locations.count - 1]
        
        let enlem = lastLocation.coordinate.latitude
        let boylam = lastLocation.coordinate.longitude
        let hiz = lastLocation.speed
        
        let location = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: location, span: zoom)
        map.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "Konum"
        //map.addAnnotation(pin)
        
        map.showsUserLocation = true
        
    }
}

extension OrderStatus: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        completionHandler()
    }
}
