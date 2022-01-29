import SwiftUI
struct Hexagon: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.size.height, rect.size.width) / 2
    let corners = corners(center: center, size: size)
    path.move(to: corners[0])
    corners[1...5].forEach() { point in
      path.addLine(to: point)
    }
    path.closeSubpath()
    return path
  }

  func corners(center: CGPoint, size: CGFloat) -> [CGPoint] {
    var points: [CGPoint] = []
    for i in (0...5) {
      points.append(flatGridCorner(center: center, size: size, i: CGFloat(i)))
    }
    return points
  }

  func flatGridCorner(center: CGPoint, size: CGFloat, i: CGFloat) -> CGPoint {
    let angle = CGFloat.pi / 3 * i
    return CGPoint(x: center.x + size * cos(angle), y: center.y + size * sin(angle))
  }
}
struct FilePreviews {
  Hexagon()
}
