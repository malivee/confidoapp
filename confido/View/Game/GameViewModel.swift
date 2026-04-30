//
//  GameViewModel.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 28/04/26.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class GameViewModel {
    var joystickOffset: CGSize = .zero
    var avatarOffset: CGSize = .zero
    private let movementMultiplier: CGFloat = 2.0
    
    let leftChairPosition = CGSize(width: 0, height: -100)
    
    var isShowingalert: Bool = false
    
    func handleDragGesture(value: DragGesture.Value) {
        let x = value.translation.width
        let y = value.translation.height
        
        let distance = sqrt(x * x + y * y)
        
        if distance < 50 {
            joystickOffset = CGSize(width: x, height: y)
            avatarOffset = CGSize(width: x * movementMultiplier, height: y * movementMultiplier)
        }
        
        checkAvatarOnChair {
            isShowingalert = true
        }
    }
    
    func endDragGesture() {
        joystickOffset = .zero
    }
    
    func checkAvatarOnChair(action: () -> Void) {
        // d = / (x2 - x1)^2 + (y2 - y1)^2
        let x = avatarOffset.width - leftChairPosition.width
        let y = avatarOffset.height - leftChairPosition.height
        
        let distance = sqrt(x * x + y * y)
        if distance < 40 {
            action()
        }
    }
    
}
