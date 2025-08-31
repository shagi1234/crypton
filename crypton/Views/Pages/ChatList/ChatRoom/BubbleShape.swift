//
//  BubbleShape.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct BubbleShape: Shape {
    let left: Bool
    let borderTopLeft: CGFloat
    let borderTopRight: CGFloat
    let borderBottomRight: CGFloat
    let borderBottomLeft: CGFloat
    
    init(left: Bool, borderTopLeft: CGFloat, borderTopRight: CGFloat, borderBottomRight: CGFloat, borderBottomLeft: CGFloat) {
        self.left = left
        self.borderTopLeft = borderTopLeft
        self.borderTopRight = borderTopRight
        self.borderBottomRight = borderBottomRight
        self.borderBottomLeft = borderBottomLeft
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        if left {
            return leftShape(width: width, height: height)
        }
        
        return rightShape(width: width, height: height)
    }
    
    func leftShape(width: CGFloat, height: CGFloat) -> Path {
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 20, y: height))
        
        /// bottom line
        bezierPath.addLine(to: CGPoint(x: width - borderBottomRight, y: height))
        /// border bottom right
        bezierPath.addCurve(to: CGPoint(x: width, y: height - borderBottomRight),
                            controlPoint1: CGPoint(x: width - borderBottomRight / 2, y: height),
                            controlPoint2: CGPoint(x: width, y: height - borderBottomRight / 2))
        
        /// left line
        bezierPath.addLine(to: CGPoint(x: width, y: borderTopRight))
        /// border top right
        bezierPath.addCurve(to: CGPoint(x: width - borderTopRight, y: 0),
                            controlPoint1: CGPoint(x: width, y: borderTopRight / 2),
                            controlPoint2: CGPoint(x: width - borderTopRight / 2, y: 0))
        
        /// top line
        bezierPath.addLine(to: CGPoint(x: borderTopLeft + 5, y: 0))
        /// border left top
        bezierPath.addCurve(to: CGPoint(x: 5, y: borderTopLeft),
                            controlPoint1: CGPoint(x: borderTopLeft / 2 + 5, y: 0),
                            controlPoint2: CGPoint(x: 5, y: borderTopLeft / 2))
        
        bezierPath.addLine(to: CGPoint(x: 5, y: height - 10))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 5, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
        
        bezierPath.addLine(to: CGPoint(x: -1, y: height))
        
        bezierPath.addCurve(to: CGPoint(x: 12, y: height - 4), controlPoint1: CGPoint(x: 4, y: height + 1), controlPoint2: CGPoint(x: 8, y: height - 1))
        
        bezierPath.addCurve(to: CGPoint(x: 20, y: height), controlPoint1: CGPoint(x: 15, y: height), controlPoint2: CGPoint(x: 20, y: height))
        
        
        return Path(bezierPath.cgPath)
    }
    
    func rightShape(width: CGFloat, height: CGFloat) -> Path {
        let bezierPath = UIBezierPath()
        
        /// begin point
        bezierPath.move(to: CGPoint(x: width - 20, y: height))
        
        /// bottom line
        bezierPath.addLine(to: CGPoint(x: borderBottomLeft, y: height))
        /// borderBottomLeft
        bezierPath.addCurve(to: CGPoint(x: 0, y: height - borderBottomLeft),
                            controlPoint1: CGPoint(x: borderBottomLeft / 2, y: height),
                            controlPoint2: CGPoint(x: 0, y: height - borderBottomLeft / 2))
        
        /// left line
        bezierPath.addLine(to: CGPoint(x: 0, y: borderTopLeft))
        /// borderTopLeft
        bezierPath.addCurve(to: CGPoint(x: borderTopLeft, y: 0),
                            controlPoint1: CGPoint(x: 0, y: borderTopLeft / 2),
                            controlPoint2: CGPoint(x: borderTopLeft / 2, y: 0))
        
        /// top line
        bezierPath.addLine(to: CGPoint(x: (width - borderTopRight) - 5, y: 0))
        /// borderTopRight
        bezierPath.addCurve(to: CGPoint(x: width - 5, y: borderTopRight),
                            controlPoint1: CGPoint(x: (width - borderTopRight / 2) - 5, y: 0),
                            controlPoint2: CGPoint(x: width - 5, y: borderTopRight / 2))
        
        
        ///
        bezierPath.addLine(to: CGPoint(x: width - 5, y: height - 12))
        bezierPath.addCurve(to: CGPoint(x: width, y: height),
                            controlPoint1: CGPoint(x: width - 5, y: height - 1),
                            controlPoint2: CGPoint(x: width, y: height))
        
        bezierPath.addLine(to: CGPoint(x: width + 1, y: height))
        
        bezierPath.addCurve(to: CGPoint(x: width - 12, y: height - 4),
                            controlPoint1: CGPoint(x: width - 4, y: height + 1),
                            controlPoint2: CGPoint(x: width - 8, y: height - 1))
        
        bezierPath.addCurve(to: CGPoint(x: width - 20, y: height),
                            controlPoint1: CGPoint(x: width - 15, y: height),
                            controlPoint2: CGPoint(x: width - 20, y: height))
        
        return Path(bezierPath.cgPath)
    }
    
}


struct BubbleShape_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            
            VStack {
                Text("Some text")
                    .foregroundColor(.primary)
                    .padding()
                    .padding(.leading, 5)
                    .background(Color.white.opacity(0.7))
                    .clipShape(BubbleShape(left: true, borderTopLeft: 10, borderTopRight: 10, borderBottomRight: 10, borderBottomLeft: 10))
            }
            
            VStack {
                Text("Some text")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.trailing, 5)
                    .background(Color.blue)
                    .clipShape(BubbleShape(left: false, borderTopLeft: 10, borderTopRight: 10, borderBottomRight: 10, borderBottomLeft: 10))
            }
            
            VStack {
                Text("Some text")
                    .foregroundColor(.primary)
                    .padding()
                    .padding(.leading, 5)
                    .background(Color.white.opacity(0.7))
                    .clipShape(BubbleShape(left: true, borderTopLeft: 10, borderTopRight: 10, borderBottomRight: 10, borderBottomLeft: 10))
            }
            VStack {
                Text("Some text")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.trailing, 5)
                    .background(Color.blue)
                    .clipShape(BubbleShape(left: false, borderTopLeft: 10, borderTopRight: 10, borderBottomRight: 10, borderBottomLeft: 10))
            }
        }
        .padding()
        .background(Color.black)
    }
}

