//
//  ListBankSampah.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation


struct ListBankSampah: Codable
{
    let id: Int
    let namaBank: String
    let alamat: String
    let longitude: Double
    let latitude: Double
    let namaAdmin: String
    let telepon: String
    let status: String
    let distance : Double
}


//var dummyLocationBank = [
//    ListBankSampah(id: 1, nama: "Bank Sampah Bonang Asri", alamat: "Komp. Perumahan Dasana Indah, Jl. Dasana Indah, Bojong Nangka, Klp. Dua, Tangerang, Banten 15810, Indonesia", telepon: "0812 777 72819", latitude: "-6.2543448", longitude: "106.5950428",email: "Bonang@LS.com", jarak: "200M",kontak: "Rudi"),
//    ListBankSampah(id: 2, nama: "Bank Sampah Lius Yulianto", alamat: "Blok UB7 No. 6, Komp. Perumahan Dasana Indah, Jl. Dasana Indah, Bojong Nangka, Klp. Dua, Tangerang, Banten 15810, Indonesia", telepon: "0856 7789 2738", latitude: "-6.253119", longitude: "106.5969165",email: "Lius@LS.com", jarak: "1,2KM",kontak: "Lius"),
//    ListBankSampah(id: 3, nama: "Bank Sampah Sae", alamat: "Jl. Nn No.24, RT.1/RW.3, Kademangan, Setu, Kota Tangerang Selatan, Banten 15314, Indonesia", telepon: "0818 7273 73628", latitude: "-6.331342", longitude: "106.6662325",email: "sae@LS.com", jarak: "2KM",kontak: "Saepul"),
//    ListBankSampah(id: 4, nama: "Bank Sampah Borneo", alamat: "Blok UB7 No. 6, Komp. Perumahan Dasana Indah, Jl. Dasana Indah, Bojong Nangka, Klp. Dua, Tangerang, Banten 15810, Indonesia", telepon: "0856 8123 8388", latitude: "-6.253119", longitude: "106.5969165",email: "borneo@LS.com", jarak: "2,1KM",kontak: "Borneo"),
//    ListBankSampah(id: 5, nama: "Bank Sampah RBU", alamat: "Kademangan, RT.3/RW.02, Kademangan, Setu, Kota Tangerang Selatan, Banten 15314, Indonesia", telepon: "0817 83248 8238", latitude: "-6.3317189", longitude: "106.6667585",email: "rbu@LS.com", jarak: "2.2KM",kontak: ""),
//    ListBankSampah(id: 6, nama: "Bank Sampah Mitra Pusani RMM", alamat: "Blok p2 no 25, Jl. Villa Melati Mas Raya Blok I10 No.25, RT.39/RW.9, Jelupang, Serpong Utara, Kota Tangerang Selatan, Banten 15323, Indonesia", telepon: "0852 6438 2345", latitude: "-6.263123", longitude: "106.6657341",email: "Pusani@LS.com", jarak: "4KM",kontak: "Sani"),
//    ListBankSampah(id: 7, nama: "Bank Sampah SDN 1 Pakualam", alamat: "Jl. Bhayangkara Raya Kel. Pakualam Serpong Utara", telepon: "021", latitude: "-6.2397867", longitude: "106.6549307",email: "-",jarak: "5KM",kontak: ""),
//    ListBankSampah(id: 8, nama: "Giant Alam Sutra (also for Tetra Pak)", alamat: "Jalur Sutera No. 32, Pakualam, Serpong Utara, Pakualam, Serpong Utara, Kota Tangerang Selatan, Banten 15320, Indonesia", telepon: "0813 8248 5123", latitude: "-6.2381937", longitude: "106.6578675",email: "Ridwan@LS.com", jarak: "9KM",kontak: "Ridwan"),
//    ListBankSampah(id: 9, nama: "Bank Sampah SW", alamat: "Jl. Kp. Pager Haur, Pagedangan, Tangerang, Banten 15331, Indonesia", telepon: "0817 0028 3381", latitude: "-6.290785", longitude: "106.6403675",email: "sw@LS.com", jarak: "15KM",kontak: "Susi")
//]
