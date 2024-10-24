import SwiftUI

extension Color {
    static let backgroundColor = Color.init(red: 15/255, green: 17/255, blue: 30/255)
    static let secondaryBackgroundColor = Color.init(red: 17/255, green: 23/255, blue: 40/255)
    static let bottomNavColor = Color.init(red: 42/255, green: 53/255, blue: 71/255)
    
    static let strokeColor = Color.init(red: 68/255, green: 68/255, blue: 68/255)
    static let stroke2Color = Color.init(red: 81/255, green: 81/255, blue: 81/255)
    
    static let primaryButtonColor = Color.init(red: 0/255, green: 97/255, blue: 255/255)
    static let primary2ButtonColor = Color.init(red: 97/255, green: 0/255, blue: 255/255)
    static let secondaryButtonColor = Color.init(red: 41/255, green: 55/255, blue: 79/255)
    
    static let primaryTextColor = Color.white
    static let secondaryTextColor = Color.init(red: 190/255, green: 192/255, blue: 199/255)
    
    static let inputBackground = Color.init(red: 23/255, green: 23/255, blue: 23/255)
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
