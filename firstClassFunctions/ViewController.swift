//
//  ViewController.swift
//  firstClassFunctions
//
//  Created by spychatter mx on 12/11/17.
//  Copyright © 2017 spychatter. All rights reserved.
//

//=== En la programación imperativa
//El codigo ejecutable ocupa memoria de solo lectura
//=== En C o C++ existe el concepto de punteros donde se puede guardar un espacio de memoria de manera arbitraria, donde podría ser una dirección a una zona de memoria donde recibe un dato.

//=== En programacion funcional desaparece
//Una variable cualquiera va a guardar un dato, pero tambien puede guardar una función.
//En el primero caso la variable se traducirá a la dirección de memoria donde recida ese dato.
//En el segundo caso se traducirá a una dirección de memoria donde reciden las intrucciones, parecido a los punteros.
//Entonces en la programación funcional nos vamos a acostumbrar a manejar funciones como si fueran datos, es decir que vamos a poder almancenar funciones en una variable o en un array.
//Cuando un lenguaje tiene la posibilidad de hacer esto, entonces a estas fuciones se le llama FUNCIONES DE PRIMERA CLASE(FIRST CLASS FUNCTIONS).
//Las funciones que pueden recibir fuciones como parametro y que además pueden devolver funciones se les llama FUNCIONES DE ORDEN SUPERIOR.




import UIKit

class ViewController: UIViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let urlString = "https://pbs.twimg.com/profile_images/561357993862643712/kc7ie0nE_400x400.png"
		let img = getImage(url: urlString, completion: getImageFromData)
		print(img.description)
		
	}
	
	//(String) -> URL
	func getURLFromString(url: String)-> URL{
		return URL(string: url)!
	}
	
	//(URL) -> Data
	func getDataFromURL(url: URL) -> Data{
		return try! Data(contentsOf: url)
	}
	
	//(Data) -> UIImage
	func getImageFromData(data: Data) -> UIImage{
		return UIImage(data: data)!
	}
	
	func getImage(url: String, completion: (Data) -> UIImage) -> UIImage{
		
		let url = getURLFromString(url: url)
		let data = getDataFromURL(url: url)
		return completion(data)
	}
	
	
	
}

