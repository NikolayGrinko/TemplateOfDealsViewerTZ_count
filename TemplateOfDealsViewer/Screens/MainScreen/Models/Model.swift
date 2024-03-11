//
//  Model.swift
//  TemplateOfDealsViewer
//
//  Created by Николай Гринько on 01.02.2024.
//

import Foundation

struct Model: Codable {
	let id: Int64
	let dateModifier: String
	let instrumentName: String
	let price: Double
	let amount: Double
	let side: Side
	
	struct Side: Codable {
		let sell, buy: String
		
	}
}
