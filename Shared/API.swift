import Alamofire
import Foundation

typealias APICallback = (Result<API.Photo, Error>) -> Void

class API {
  static let shared = API()
  var urlSession = URLSession.shared
  let baseUrl = URL(string: "https://d7c7-75-31-21-186.ngrok.io")

  struct Photo: Codable {
    let image: String
  }

  func uploadPhoto(photo: UIImage, then handler: @escaping APICallback) {
    guard let photoData = photo.pngData()
    else {
      handler(.failure("Png Data Error" as Error))
      return
    }
    let photo = Photo(image: photoData.base64EncodedString(options: .lineLength64Characters))
    do {
      let json = try JSONEncoder().encode(photo)
    } catch { handler(.failure(error)) }
    sendPostRequest(to: "/photos", json: json, then: handler)
  }

  private func sendPostRequest(to: String, json: String, then handler: @escaping APICallback) {
    guard var url = baseUrl else { return }
    url.appendPathComponent(to)
    if let body = json.data(using: .utf8) {
    AF.upload(body, to: url).responseDecodable(of: Photo.self) { response in
      if let photo = response.value {
        handler(.success(photo))
      } else if let error = response.error {
        handler(.failure(error))
      }
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
