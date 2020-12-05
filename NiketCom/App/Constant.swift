//
//  Constant.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit

struct Constant {
    
    struct AppTheme {
        static var mainBlue: UIColor  { return UIColor("#0064d2") }
        static var baseTextColor: UIColor { return UIColor("#37405b") }
        static var shadowColor: UIColor { UIColor("#E6E6E6") }
    }
    
    struct GridMenuItems {
        var title: String
        var icon: UIImage
        
        static var items: [GridMenuItems] {
            return [
                GridMenuItems(title: "Pesawat", icon: #imageLiteral(resourceName: "icairplane")),
                GridMenuItems(title: "Hotel", icon: #imageLiteral(resourceName: "ichotels")),
                GridMenuItems(title: "To Do", icon: #imageLiteral(resourceName: "icTodo")),
                GridMenuItems(title: "Kereta Api", icon: #imageLiteral(resourceName: "icKereta")),
                GridMenuItems(title: "Sewa Mobil", icon: #imageLiteral(resourceName: "icSewaMobil")),
                GridMenuItems(title: "Event", icon: #imageLiteral(resourceName: "icEvent")),
                GridMenuItems(title: "Airport Transport", icon: #imageLiteral(resourceName: "icAirportTransport")),
                GridMenuItems(title: "PayLater", icon: #imageLiteral(resourceName: "icEvent"))
            ]
        }
    }
    
}
