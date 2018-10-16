//
//  DetailBankSampahViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit
import MapKit
class DetailBankSampahViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lblEmail: UILabel!
    var IDData : Int = 1
    @IBOutlet weak var titleDetail: UINavigationItem!
    @IBOutlet weak var lblBankSampahTitle: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var lblTelepon: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    var latitude : Double = 0
    var longtitude : Double = 0
    @IBOutlet weak var BtnDirection: UIButton!
    
    
    func setDetailBankSampah()  {
        let bank = dummyLocationBank[IDData]
        longtitude = Double(bank.longitude)!
        latitude = Double(bank.latitude)!
        lblBankSampahTitle.text = bank.nama
        lblAlamat.text = bank.alamat
        lblTelepon.text = bank.telepon
        lblEmail.text = bank.email
        lblContact.text = bank.kontak
        
        
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
        BtnDirection.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.4666666667, blue: 0.368627451, alpha: 1)
        
        setDetailBankSampah()
        setMapView()
        
        
        
        
    }
}