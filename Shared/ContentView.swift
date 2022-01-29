import Combine
import SwiftUI

struct ContentView: View {
  @ObservedObject var state: AppState

  var body: some View {
    NavigationView {
      ScrollView {
        //        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "IMG_1322", withExtension: "MOV")!))
        //          .scaledToFit()
        ForEach(state.photos) { photo in
          NavigationLink(destination: ImageDetail(photo: photo)) { Image(uiImage: photo.uiImage)
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
          AddPhoto(state: state)
        }
      }
      .ignoresSafeArea()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
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
    ContentView(state: appState)
  }
}
