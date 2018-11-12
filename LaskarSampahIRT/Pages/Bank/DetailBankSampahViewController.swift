//
//  DetailBankSampahViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailBankSampahViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lblEmail: UILabel!
    var IDData : Int = 1
    @IBOutlet weak var titleDetail: UINavigationItem!
    @IBOutlet weak var lblBankSampahTitle: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
//    @IBOutlet weak var lblTelepon: UILabel!
    @IBOutlet weak var lblTelepon: UITextView!
    
    @IBOutlet weak var lblContact: UILabel!
    var latitude : Double = 0
    var longtitude : Double = 0
    var bankSampah: ListBankSampah?
    
    @IBOutlet weak var BtnDirection: UIButton!
    
    @IBOutlet weak var viewBgitem: UIView!
    
    var detailSampah = [ListBankSampah]()
    let apiHelper = ApiHelper()
    
    func setDetailBankSampah()  {
//        let bank = dummyLocationBank[IDData]
//        longtitude = Double(bank.longitude)!
//        latitude = Double(bank.latitude)!
//        lblBankSampahTitle.text = bank.nama
//        lblAlamat.text = bank.alamat
//        lblTelepon.text = bank.telepon
//        lblEmail.text = bank.email
//        lblContact.text = bank.kontak
//
  
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
//        var currentLocation: CLLocation!
        
//        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
//            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
//            currentLocation = locManager.location
//        }
//        let currLatitude = currentLocation.coordinate.latitude
//        let currLongitude = currentLocation.coordinate.longitude
        
        
        
//        self.apiHelpere.fetchBankList(longitude: currentLocation.coordinate.longitude, latitude: currentLocation.coordinate.latitude)
//        { (ListBankSampah) in
//            if let BankList = ListBankSampah
//            {
//                self.bankList = BankList
//                DispatchQueue.main.async
//                    {
//                        self.tableViewBank.reloadData()
//                }
//            }
//        }
        
        print(IDData)
       let bankSampah = self.bankSampah
        
        
        longtitude = Double(bankSampah?.longitude ?? longtitude)
        latitude = Double(bankSampah?.latitude ?? latitude)
        lblBankSampahTitle.text = bankSampah?.namaBank
        lblAlamat.text = bankSampah?.alamat
        lblTelepon.text = bankSampah?.telepon.replacingOccurrences(of: "\"", with: "")
        //lblEmail.text = "\(bankSampah?.distance)"
        lblContact.text = bankSampah?.namaAdmin
        
        let jarak = String(format:"%.1f",(bankSampah?.distance)!) + "Km"
        lblEmail?.text = jarak
        
        
    }
    @IBAction func btnPetunjukArah(_ sender: Any)
    {
        getDirection(latitude: latitude, longitude: longtitude, storeName: lblBankSampahTitle.text)
    }
    
    func getDirection(latitude : Double?, longitude : Double?, storeName : String?) {
        if let lat = latitude, let lot = longitude {
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(lat, lot)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            
            if let name = storeName {
                mapItem.name = name
            }
            
            var options : NSDictionary! = nil
            options = [
                MKLaunchOptionsMapCenterKey: NSValue.init(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ]
            
            mapItem.openInMaps(launchOptions: options as? [String : Any])
        }
        
    }
    
    
    func setMapView()
    {
        mapView.layer.borderWidth = 1
        mapView.layer.cornerRadius = 10
        let lokasi = CLLocationCoordinate2D(latitude: latitude    , longitude: longtitude)
        mapView.setCenter(lokasi, animated: true)
        
        let radius: CLLocationDistance = 1000
        let region = MKCoordinateRegion(center: lokasi, latitudinalMeters: radius, longitudinalMeters: radius)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lokasi.latitude, longitude: lokasi.longitude)
        self.mapView.addAnnotation(annotation)
        
        
        
        mapView.setRegion(region, animated: true)
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BtnDirection.layer.cornerRadius = 10
        BtnDirection.backgroundColor = #colorLiteral(red: 0.8214223385, green: 0.81848979, blue: 0.1368253231, alpha: 1)
        
        viewBgitem.layer.cornerRadius = 10
        
        setDetailBankSampah()
        setMapView()
        
        
        
        
    }
}
