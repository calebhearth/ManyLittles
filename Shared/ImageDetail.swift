//
//  ImageDetail.swift
//  ManyLittles
//
//  Created by Caleb Hearth on 12/18/21.
//

import SwiftUI

struct ImageDetail: View {
  let photo: Photo
    var body: some View {
      VStack {
        Image(uiImage: photo.uiImage)
          .resizable()
          .scaledToFit()

        HStack {
          Spacer()
          VStack(alignment: .leading) {
            Text(photo.createdAt.description)
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
      ImageDetail(photo: .init(named: "IMG_0901"))
    }
}
