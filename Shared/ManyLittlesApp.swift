//
//  ManyLittlesApp.swift
//  Shared
//
//  Created by Caleb Hearth on 12/18/21.
//

import SwiftUI

@main
struct ManyLittlesApp: App {
  let images = ["IMG_0898", "IMG_0905", "IMG_1220", "IMG_1260", "IMG_1322", "IMG_1722", "IMG_0901", "IMG_1120", "IMG_1226", "IMG_1321", "IMG_1357", "IMG_1723"]
    var body: some Scene {
        WindowGroup {
          ContentView(images: images)
        }
    }
}
