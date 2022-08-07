//
//  Song.swift
//  SongHelpApp
//
//  Created by Donizetti de Souza on 8/6/22.
//

import Foundation
import UIKit

class Song { //definindo a classe dos elementos
    
    var songName: String
    var bandImage: UIImage
    var bandName: String
    var bandLink: String
    
    init(name: String, image: UIImage, band: String, link: String) {
        songName = name
        bandImage = image
        bandName = band
        bandLink = link
    }
}
