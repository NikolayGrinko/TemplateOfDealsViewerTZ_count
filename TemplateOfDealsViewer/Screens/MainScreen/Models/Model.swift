//
//  Model.swift
//  TemplateOfDealsViewer
//
//  Created by Николай Гринько on 01.02.2024.
//

import Foundation

struct Model {
  let id: Int64
  let dateModifier: Date
  let instrumentName: String
  let price: Double
  let amount: Double
  let side: Side
  
  enum Side: CaseIterable {
	case sell, buy
  }
}
