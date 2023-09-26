class Profile {
    var nome: String
    var birthday: String
    var cellphone: String
    var email: String
    private var password: String
    var friends: [String] = []
    var watchedList = 0
    var watchedTime = 0.0 {
        willSet {
            watchedTime + newValue
        }
        didSet {
            if watchedTime < oldValue {
                print("Valor não pode ser zero.")
                watchedTime = oldValue
            }
        }
    }
    static var profileCount = 0
    
    
    init(nome: String, birthday: String, cellphone: String, email: String, password: String) {
        self.nome = nome
        self.birthday = birthday
        self.cellphone = cellphone
        self.email = email
        self.password = password
        Profile.profileCount += 1
    }
        
    func addFriend() {
        friends.append(nome)
        }
    
    func watched(_ tempo: Double) {
        watchedTime += tempo
        watchedList += 1
    }
}

class Group {
    var groupName: String
    var groupCreator: String
    var groupMembers: [String] = []
    static var groupCount = 0
    
    init(groupName: String, groupCreator: String) {
        self.groupName = groupName
        self.groupCreator = groupCreator
        Group.groupCount += 1
    }
    
    func addGroupMember(_ nome: String) {
        groupMembers.append(nome)
    }
    
}

enum ContentType: String {
    case movie = "Movie"
    case serie = "Serie"
}

protocol Content {
    var type: String { get set }
    var name: String { get set }
    var genre: String { get set }
    var time: Double { get }
    var releaseDate: String { get set }
    var ageRange: Int { get set }
    var likes: Int { get set }
    static var contentCount: Int { get }
    var watched: Bool { get }
}


class Movies: Content {
    var type: String
    var name: String
    var genre: String
    var time: Double
    var releaseDate: String
    var ageRange: Int
    var likes = 0
    static var contentCount = 0
    static var movieCount = 0
    var watched = true
    
    init(type: String, name: String, genre: String, time: Double, releaseDate: String, ageRange: Int) {
        self.type = type
        self.name = name
        self.genre = genre
        self.time = time
        self.releaseDate = releaseDate
        self.ageRange = ageRange
        Movies.contentCount += 1
        Movies.movieCount += 1
    }
    
    func movieLiked(_ like: Bool) {
        if like == true {
            return likes += 1
        }
    }
}

class Series: Content {
    var type: String
    var name: String
    var genre: String
    var time: Double
    var releaseDate: String
    var ageRange: Int
    var likes = 0
    static var contentCount = 0
    static var seriesCount = 0
    var seasons: Int
    var watched = true
    
    init(type: String, name: String, genre: String, time: Double, releaseDate: String, ageRange: Int, seasons: Int) {
        self.type = type
        self.name = name
        self.genre = genre
        self.time = time
        self.releaseDate = releaseDate
        self.ageRange = ageRange
        self.seasons = seasons
        Series.contentCount += 1
        Series.seriesCount += 1
    }
    
    func seriesLiked(_ like: Bool) {
        if like == true {
            return likes += 1
        }
    }
}





func checkType (_ type: ContentType) {
    switch type {
    case .movie: print("It's a movie.")
    case .serie: print("It's a serie")
    }
    
}




var profile1 = Profile(nome: "Gustavo", birthday: "09/03/1995", cellphone: "+5511989100396", email: "gstvadami@gmail.com", password: "Gfa090395!")
var profile2 = Profile(nome: "Allaf Barros", birthday: "05/05/1995", cellphone: "+5511943560234", email: "allaf@gmail.com", password: "12345")
var group1 = Group(groupName: "Amigos", groupCreator: "Gustavo Adami")
    
var movie1 = Movies(type: "Movies", name: "Teste", genre: "Drama", time: 90.00, releaseDate: "2019", ageRange: 18)


var movie2 = Movies(type: "Movies", name: "Teste2", genre: "Terror", time: 120.00, releaseDate: "2018", ageRange: 18)

profile1.watched(movie1.time)
print(profile1.watchedList)
print(profile1.watchedTime)
profile1.watched(movie2.time)
print(profile1.watchedList)
print(profile1.watchedTime)


