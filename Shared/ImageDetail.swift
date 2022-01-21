//
//  ImageDetail.swift
//  ManyLittles
//
//  Created by Caleb Hearth on 12/18/21.
//

import SwiftUI

struct ImageDetail: View {
  let image: String
    var body: some View {
      VStack {
        Image(image)
          .resizable()
          .scaledToFit()

        HStack {
          Spacer()
          VStack(alignment: .leading) {
            Text("Wednesday Dec 15, 2021")
              .font(.headline)
            Text("Uploaded by Caleb")
              .font(.subheadline)

            HStack {
              Button(action: {}) {
                Label("Comment", systemImage: "bubble.left.fill")
              }
              Button(action: {}) {
                Label("Appreciate", systemImage: "hands.clap.fill")
              }
            }
          }
          Spacer()
          Spacer()
        }
        Spacer()
      }
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
      ImageDetail(image: "IMG_0901")
    }
}
