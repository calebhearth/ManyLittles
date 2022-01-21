import SwiftUI

struct AddPhoto: View {
  @State private var image: Image?
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?
  @State private var alert = false
  @State private var message = "Default"


  var body: some View {
    Button(action: {showingImagePicker.toggle()}) {
      HStack {
        Label("Add Photo", systemImage: "photo")

      }
    }
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: $inputImage)
    }
    .onChange(of: inputImage) { _ in loadImage() }
    .alert(message, isPresented: $alert) {
      Button("OK", role: .cancel) {}
    }
  }

  func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)
    let _ = API.shared.uploadPhoto(photo: inputImage, then: { photo in })
  }
}

struct AddPhoto_Previews: PreviewProvider {
  static var previews: some View {
    AddPhoto()
  }
}
