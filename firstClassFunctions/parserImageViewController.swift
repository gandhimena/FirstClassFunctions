//
//  parserImageViewController.swift
//  firstClassFunctions
//
//  Created by spychatter mx on 12/11/17.
//  Copyright © 2017 spychatter. All rights reserved.
//

import UIKit

class ParserImageViewController: UIViewController{
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let urlString = "https://pbs.twimg.com/profile_images/561357993862643712/kc7ie0nE_400x400.png"
		let img = getImageFromData
		let image = getImage(urlString: urlString, completion: img)
		print(image.description)
	}
	
	func getURLImage(link: String) -> URL{
		return URL(string: link)!
	}
	
	func getDataImage(url: URL) -> Data{
		return try! Data(contentsOf: url)
	}
	
	func getImageFromData(data:Data) -> UIImage{
		return UIImage(data: data)!
	}
	
	
	func getImage(urlString:String, completion: (Data)-> UIImage)-> UIImage{
		
		let url = getURLImage(link: urlString)
		let dataImage = getDataImage(url: url)
		return completion(dataImage)
		
	}
	
	
	
}
