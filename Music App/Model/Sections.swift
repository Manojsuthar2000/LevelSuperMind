import Foundation

struct Section {
    let header: String
    let height: CGFloat
    let weight: CGFloat
    let rowCount: Int
    let playList: [String]
}

struct Sections {
    var sectionList = [Section]()
    let headerHeight: CGFloat = 36
    
    init() {
        var header = "Continue Playing"
        var playList = ["Aashiqui 2", "ANIMAL", "kabir Singh", "Still Rollin", "Making Memories", "Moosetape", "Ek Tha Raja"]
        let section1 = Section(header: header, height: 220, weight: 160, rowCount: 1, playList: playList)
        sectionList.append(section1)
        
        header = "Recommended for you"
        playList = []
        let section2 = Section(header: header, height: 150, weight: 0, rowCount: 1, playList: playList)
        sectionList.append(section2)
        
        header = "Music Playlists"
        playList = ["Aashiqui 2", "ANIMAL", "kabir Singh", "Still Rollin", "Making Memories", "Moosetape", "Ek Tha Raja"]
        let section3 = Section(header: header, height: 180, weight: 100, rowCount: 1, playList: playList)
        sectionList.append(section3)
        
        header = "Trending"
        playList = ["Baby", "Without Me", "Be Somebody", "Who I Am "]
        let section4 = Section(header: header, height: 80, weight: 0, rowCount: 4, playList: playList)
        sectionList.append(section4)
    }
    
}
