import Alamofire
import Foundation

typealias APICallback = (Result<API.Photo, Error>) -> Void

class API {
  static let shared = API()
  var urlSession = URLSession.shared
  let baseUrl = URL(string: "http://localhost:3000")

  struct Photo: Codable {
    let id: Int
    let created_at: Date
    let updated_at: Date
    let url: URL
    let image_url: URL
  }

  func uploadPhoto(photo: UIImage, then handler: @escaping APICallback) {
    guard let photoData = photo.pngData()
    else {
      handler(.failure("Png Data Error" as Error))
      return
    }
    let body = MultipartFormData()
    body.append(photoData, withName: "photo[image]", fileName: "\(UUID().uuidString).png", mimeType: "image/png")
    sendPostRequest(to: "/photos", body: body, then: handler)
  }

  private func sendPostRequest(to: String, body: MultipartFormData, then handler: @escaping APICallback) {
    guard var url = baseUrl else { return }
    url.appendPathComponent(to)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
    AF
      .upload(multipartFormData: body, to: url)
      .responseDecodable(of: Photo.self, decoder: decoder) { response in
      if let photo = response.value {
        debugPrint(photo)
        handler(.success(photo))
      } else if let error = response.error {
        print(response.debugDescription)
        handler(.failure(error))
      }
    }
  }

}
//  private func sendPostRequest(to: String, body: Data, then handler: @escaping APICallback) {
//    var request = URLRequest(url: URL(string: to, relativeTo: baseUrl)!)
//    request.httpMethod = "POST"
//    request.httpBody = body
//    urlSession.dataTask(with: request, completionHandler: { data, response, error in
//      if let data = data {
//        handler(Result { data.flatMap { try? JSONDecoder().decode(Photo.self, from: $0) }.first })
//      } else if let error = error {
//        handler(.failure(error))
//      }
//    })
//      .resume()
//  }
