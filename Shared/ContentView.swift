import SwiftUI
import AVKit

struct ContentView: View {
  let images: [String]
  var body: some View {
    NavigationView {
      ScrollView {
        //        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "IMG_1322", withExtension: "MOV")!))
        //          .scaledToFit()
        ForEach(images, id: \.self) { image in
          NavigationLink(destination: ImageDetail(image: image)) { Image(image)
            .resizable()
            .scaledToFill()
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .bottomBar) {
          Button(action: {}) {
            HStack {
              Image(systemName: "house")
              Text("")
            }
          }
        }
        ToolbarItem(placement: .bottomBar) {
          Button(action: {}) {
            Image(systemName: "map")
          }
        }
        ToolbarItem(placement: .bottomBar) {
          Button(action: {}) {
            Image(systemName: "calendar")
          }
        }
        ToolbarItem(placement: .bottomBar) {
          AddPhoto()
        }
      }
      .ignoresSafeArea()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let images: [String] = ["IMG_0898", "IMG_0905", "IMG_1220", "IMG_1260", "IMG_1722", "IMG_0901", "IMG_1120", "IMG_1226", "IMG_1321", "IMG_1357", "IMG_1723"]
    ContentView(images: images)
  }
}
