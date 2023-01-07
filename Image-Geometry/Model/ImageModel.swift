//
//  ImageModel.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 21/12/2022.
//

import Foundation

struct ImageModel : Identifiable{
    var id = UUID().uuidString
    var name : String
    var subTitle : String
    var pictures : String
    
}

var todayImage : [ImageModel] = [
    
    ImageModel(name: "Impeccable View", subTitle: "Nice very impeccable", pictures: "background-1"),
    ImageModel(name: "Exquisite View", subTitle: "Nice very impeccable", pictures: "background-2"),
    ImageModel(name: "Beautiful View", subTitle: "Nice very impeccable", pictures: "background-3")
]

var dummyText = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."
