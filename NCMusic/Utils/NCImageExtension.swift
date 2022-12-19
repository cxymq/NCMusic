//
//  NCImageExtension.swift
//  NCMusic
//
//  Created by nazimai on 2022/12/19.
//

import Foundation
import UIKit

extension UIImage {
    func blurImage() -> UIImage {
        let context = CIContext (options: nil )
        let inputImage = CIImage (image: self)
        //使用高斯模糊滤镜
        let filter = CIFilter (name: "CIGaussianBlur" )!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        //设置模糊半径值（越大越模糊）
        filter.setValue(30, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect (origin:  CGPoint .zero, size: self.size)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        //显示生成的模糊图片
        let newImage = UIImage (cgImage: cgImage!)
        return newImage
    }
}
