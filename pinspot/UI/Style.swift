//
//  Style.swift
//  beisbol
//
//  Created by Carlos Marcano on 9/17/17.
//  Copyright © 2017 Carlos Marcano. All rights reserved.
//

import UIKit

public struct Style {

    public struct Color {
        public static let white = UIColor.white
        public static let black = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        public static let dimBlack = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        public static let veryDimBlack = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        public static let lightBackground = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        public static let background = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        public static let clear = UIColor.clear
        public static let accent = UIColor(red: 1.0, green: 0.83, blue: 0.0, alpha: 1.0)
        public static let warning = UIColor.orange
        public static let alert = UIColor.red
        public static let blueTint = UIColor(red: 0.0, green:122.0/255.0, blue:1.0, alpha:1.0)
        public static let navigationWhite = UIColor.init(white: 0.97, alpha: 0.8)
        
        public static let primaryLeones = UIColor(red: 15.0/255.0, green:72.0/255.0, blue:141.0/255.0, alpha:1.0)
        public static let primaryNavegantes = UIColor(red: 180.0/255.0, green:207.0/255.0, blue:221.0/255.0, alpha:1.0)
        public static let primaryTiburones = UIColor(red: 50.0/255.0, green:47.0/255.0, blue:145.0/255.0, alpha:1.0)
        public static let primaryTigres = UIColor(red: 185.0/255.0, green:14.0/255.0, blue:21.0/255.0, alpha:1.0)
        public static let primaryCaribes = UIColor(red: 250.0/255.0, green:175.0/255.0, blue:79.0/255.0, alpha:1.0)
        public static let primaryAguilas = UIColor(red: 232.0/255.0, green:110.0/255.0, blue:24.0/255.0, alpha:1.0)
        public static let primaryCardenales = UIColor(red: 214.0/255.0, green:30.0/255.0, blue:38.0/255.0, alpha:1.0)
        public static let primaryBravos = UIColor(red: 82.0/255.0, green:196.0/255.0, blue:231.0/255.0, alpha:1.0)

        public static let secondaryLeones = UIColor(red: 252.0/255.0, green: 186.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        public static let secondaryNavegantes = UIColor(red: 0.0, green: 103.0/255.0, blue: 180.0/255.0, alpha:1.0)
        public static let secondaryTiburones = UIColor(red: 255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        public static let secondaryTigres = UIColor(red: 239.0/255.0, green:149.0/255.0, blue:53.0/255.0, alpha:1.0)
        public static let secondaryCaribes = UIColor(red: 34.0/255.0, green:50.0/255.0, blue:89.0/255.0, alpha:1.0)
        public static let secondaryAguilas = UIColor(red: 34.0/255.0, green:30.0/255.0, blue:31.0/255.0, alpha:1.0)
        public static let secondaryCardenales = UIColor(red: 255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        public static let secondaryBravos = UIColor(red: 34.0/255.0, green:30.0/255.0, blue:31.0/255.0, alpha:1.0)

        public static func random(alpha: CGFloat = 1.0 ) -> UIColor {
            return UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: alpha)
        }
    }

    public struct Size {

        public static let smallCornerRadius: CGFloat = 6.0
        public static let cornerRadius: CGFloat = 10.0

        public static let extraSmallPadding: CGFloat = 3.0
        public static let smallPadding: CGFloat = 6.0
        public static let padding: CGFloat = 12.0
        public static let largePadding: CGFloat = 20.0

        public static let smallControl: CGFloat = 30.0
        public static let control: CGFloat = 40.0

        public static let indicatorHeight: CGFloat = 2.0

        /// 1.0 / UIScreen.main.scale
        public static let onePixel: CGFloat = 1.0 / UIScreen.main.scale
    }
}
