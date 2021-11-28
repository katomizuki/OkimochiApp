
import Foundation

struct UserRepositry {
    static let shared = UserRepositry()
    
    func saveUserDefaults<T:Codable>(element:T,key:String) {
        do {
            let data = try JSONEncoder().encode(element)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func saveToken(token:String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    func getToken()->String? {
      return UserDefaults.standard.string(forKey: "token")
    }
    
    func loadUserDefaults<T:Codable>(key:String) ->T {
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else { fatalError() }
            let decodeData = try JSONDecoder().decode(T.self, from: data)
            return decodeData
        } catch {
            print(error)
            fatalError()
        }
    }
    
    func deleteUserDefaults(key:String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
