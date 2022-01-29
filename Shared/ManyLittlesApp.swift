//
//  ManyLittlesApp.swift
//  Shared
//
//  Created by Caleb Hearth on 12/18/21.
//

import SwiftUI

@main
struct ManyLittlesApp: App {
  let appState = AppState(photos: [
    .init(named: "IMG_0898"),
    .init(named: "IMG_0905"),
    .init(named: "IMG_1220"),
    .init(named: "IMG_1260"),
    .init(named: "IMG_1722"),
    .init(named: "IMG_0901"),
    .init(named: "IMG_1120"),
    .init(named: "IMG_1226"),
    .init(named: "IMG_1321"),
    .init(named: "IMG_1357"),
    .init(named: "IMG_1723"),
  ])

  var body: some Scene {
    return WindowGroup {
      Hexagon()
    }
  }
}
