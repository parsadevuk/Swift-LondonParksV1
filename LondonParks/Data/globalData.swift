//
//  profile.swift
//  LondonParks
//
//  Created by Parsa Shobany on 30/08/2022.
//
//https://stackoverflow.com/questions/58842643/change-default-system-font-in-swiftui

import Foundation
import SwiftUI

var parkN : Int = 0
let invertPrimary : Color = Color(UIColor.systemBackground)
let dragNumber: Int = 35
let buttonScale = 1.5


extension Font {
    static let pDVeryLargeTitle = Font.custom("Roboto-Bold", size: 60, relativeTo: .caption)
    static let pDLargeTitle = Font.custom("Roboto-Bold", size: 52, relativeTo: .caption)
    static let pDMediumFont = Font.custom("Roboto-Regular", size: 48, relativeTo: .caption)
    static let pDMediumSmallFont = Font.custom("Roboto-Medium", size:34 , relativeTo: .caption)
    static let pDSmallFont = Font.custom("Roboto-Medium", size: 12, relativeTo: .caption)
    static let pDVerySmallFont = Font.custom("Roboto-Thin", size: 10, relativeTo: .caption)
}


