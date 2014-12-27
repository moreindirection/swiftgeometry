import Foundation

public extension CGPoint {
    public func mapX(f: (CGFloat -> CGFloat)) -> CGPoint {
        return self.withX(f(self.x))
    }
    
    public func mapY(f: (CGFloat -> CGFloat)) -> CGPoint {
        return self.withY(f(self.y))
    }
    
    public func withX(x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: self.y)
    }
    
    public func withY(y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: y)
    }
}

public extension CGSize {
    public func mapWidth(f: (CGFloat -> CGFloat)) -> CGSize {
        return self.withWidth(f(self.width))
    }
    
    public func mapHeight(f: (CGFloat -> CGFloat)) -> CGSize {
        return self.withHeight(f(self.height))
    }
    
    public func withWidth(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: self.height)
    }
    
    public func withHeight(height: CGFloat) -> CGSize {
        return CGSize(width: self.width, height: height)
    }
}

public extension CGRect {
    public func mapX(f: (CGFloat -> CGFloat)) -> CGRect {
        return self.withX(f(self.origin.x))
    }
    
    public func mapY(f: (CGFloat -> CGFloat)) -> CGRect {
        return self.withY(f(self.origin.y))
    }
    
    public func mapWidth(f: (CGFloat -> CGFloat)) -> CGRect {
        return self.withWidth(f(self.size.width))
    }
    
    public func mapHeight(f: (CGFloat -> CGFloat)) -> CGRect {
        return self.withHeight(f(self.size.height))
    }
    
    public func withX(x: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.withX(x), size: self.size)
    }
    
    public func withY(y: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.withY(y), size: self.size)
    }
    
    public func withWidth(width: CGFloat) -> CGRect {
        return CGRect(origin: self.origin, size: self.size.withWidth(width))
    }
    
    public func withHeight(height: CGFloat) -> CGRect {
        return CGRect(origin: self.origin, size: self.size.withHeight(height))
    }
    
    public func splitHorizontally(factor: CGFloat) -> (left: CGRect, right: CGRect) {
        assert(factor >= 0.0 && factor <= 1.0, "must pass a percentage to splitHorizontally")
        let leftHalfFrame = self.mapWidth { $0 * factor }
        let rightHalfFrame = leftHalfFrame.mapX { $0 + leftHalfFrame.size.width }.withWidth(self.size.width * (1.0 - factor))
        
        return (left: leftHalfFrame, right: rightHalfFrame)
    }
    
    public func splitVertically(factor: CGFloat) -> (top: CGRect, bottom: CGRect) {
        assert(factor >= 0.0 && factor <= 1.0, "must pass a percentage to splitVertically")
        let topHalfFrame = self.mapHeight { $0 * factor }
        let bottomHalfFrame = topHalfFrame.mapY { $0 + topHalfFrame.size.height }.withHeight(self.size.height * (1.0 - factor))
        
        return (top: topHalfFrame, bottom: bottomHalfFrame)
    }
}