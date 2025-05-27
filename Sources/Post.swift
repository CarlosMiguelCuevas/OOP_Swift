public class KodecoPost {
    private let author: String
    private var content: String
    private var likes:Int
    
    public init (author: String, content: String, likes: Int) {
        self.author = author
        self.content = content
        self.likes = likes
    }
    
    public func display() -> String {
        return "Author: \(author)\nContent: \(content)\nNumber of Likes: \(likes)"
    }
    
}
