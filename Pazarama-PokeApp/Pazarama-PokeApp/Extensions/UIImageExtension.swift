//
//  UIImageExtension.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import Foundation
import UIKit

extension UIImage {
  var primaryColor: UIColor? {
    guard let ciImage = CIImage(image: self) else { return nil }
    let colorFilter = CIFilter(name: "CIAreaAverage")
    colorFilter?.setValue(ciImage, forKey: kCIInputImageKey)
    if let outputImage = colorFilter?.outputImage {
      var bitmap = [UInt8](repeating: 0, count: 4)
      let context = CIContext(options: nil)
      context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
      return UIColor(
        red: CGFloat(bitmap[0]) * 3 / 255.0,
        green: CGFloat(bitmap[1]) * 3 / 255.0,
        blue: CGFloat(bitmap[2]) * 3 / 255.0,
        alpha: 1
      )
    }
    return nil
  }
  var secondaryColor: UIColor? {
    guard let ciImage = CIImage(image: self) else { return nil }
    let colorFilter = CIFilter(name: "CIAreaAverage")
    colorFilter?.setValue(ciImage, forKey: kCIInputImageKey)
    if let outputImage = colorFilter?.outputImage {
      var bitmap = [UInt8](repeating: 0, count: 4)
      let context = CIContext(options: nil)
      context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
      return UIColor(
        red: CGFloat(bitmap[0]) * 3 / 255.0,
        green: CGFloat(bitmap[1]) * 3 / 255.0,
        blue: CGFloat(bitmap[2]) * 3 / 255.0,
        alpha: 0.5
      )
    }
    return nil
  }
}
