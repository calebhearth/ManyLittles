import SwiftUI
import Combine

class AddPhotoState: ObservableObject {
  @Published var showingImagePicker: Bool
  @Published var inputImage: UIImage?
  @Published var alert: Bool
  @Published var message: String

  init(
    showingImagePicker: Bool = false,
    inputImage: UIImage? = nil,
    alert: Bool = false,
    message: String = "Default"
  ) {
    self.showingImagePicker = showingImagePicker
    self.inputImage = inputImage
    self.alert = alert
    self.message = message
  }
}

struct AddPhoto: View {
  @ObservedObject var state: AppState

  var body: some View {
    Button(action: { state.addPhotoState.showingImagePicker = true }) {
      HStack {
        Label("Add Photo", systemImage: "photo")
      }
    }
    .sheet(isPresented: $state.addPhotoState.showingImagePicker) {
      ImagePicker(image: $state.addPhotoState.inputImage)
    }
    .onChange(of: state.addPhotoState.inputImage) { _ in loadImage() }
    .alert(
      state.addPhotoState.message,
      isPresented: $state.addPhotoState.showingImagePicker
    ) {
      Button("OK", role: .cancel) {}
    }
  }

  func loadImage() {
    guard let inputImage = state.addPhotoState.inputImage else { return }
    API.shared.uploadPhoto(photo: inputImage, then: { result in
      switch result {
      case .success(let photo):
        state.photos.append(photo)
      case .failure(let error):
        print(error)
      }
    })
  }
}

struct AddPhoto_Previews: PreviewProvider {
  static var previews: some View {
    AddPhoto(state: .init(addPhotoState: .init(message: "Select a photo to upload.")))
  }
}
