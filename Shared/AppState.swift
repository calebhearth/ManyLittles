import Combine
import UIKit

class AppState: ObservableObject {
  @Published var photos: [Photo]
  @Published var addPhotoState: AddPhotoState

  init(photos: [Photo] = [], addPhotoState: AddPhotoState = .init()) {
    self.photos = photos
    self.addPhotoState = addPhotoState
  }
}

struct Photo: Identifiable, Codable {
  var id = UUID()
  var createdAt: Date
  var updatedAt: Date
  var url: URL
  var imageUrl: URL

  var uiImage: UIImage = .init()

  init(named: String) {
    uiImage = UIImage(named: named)!
    createdAt = Date()
    updatedAt = Date()
    url = URL(string: "http://example.com")!
    imageUrl = URL(string: "http://example.com")!
  }

  enum CodingKeys: String, CodingKey {
    case id, url
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case imageUrl = "image_url"
  }
}
