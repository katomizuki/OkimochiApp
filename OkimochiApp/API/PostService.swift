import Alamofire
import Moya
import RxSwift
protocol PostServiceProtocol {
    func fetchMyPost(token:String)->Single<MyLetterResult>
    func getLetters(token:String)->Single<[Letter]>
    func saveLetter(id: String,token:String) -> Completable
    func deleteLetter(id:String, token:String) -> Completable
    func deleteSavedLetter(id:String ,token: String) -> Completable
    func postLetter(dic:[String:Any],token: String) -> Completable
    func updateLetter(id:String,letter:Letter,token:String) -> Completable
}
struct PostService:PostServiceProtocol {
    
    func fetchMyPost(token:String)->Single<MyLetterResult> {
        APIClient.shared.request(MyLetterAPI.fetchMyLetters(token: token))
    }
    
    func getLetters(token:String)->Single<[Letter]> {
        APIClient.shared.request(PostAPI.get(token: token))
    }
 
    func saveLetter(id: String,token:String) -> Completable {
        APIClient.shared.requestCompletable(PostAPI.save(id: id, token: token))
    }
    
    func deleteLetter(id:String, token:String) -> Completable {
        APIClient.shared.requestCompletable(PostAPI.delete(id: id, token: token))
    }
    

    func deleteSavedLetter(id:String ,token: String) -> Completable {
        APIClient.shared.requestCompletable(PostAPI.delete(id: id, token: token))
    }

    func postLetter(dic:[String:Any],token: String) -> Completable {
        APIClient.shared.requestCompletable(PostAPI.post(dic: dic, token: token))
    }
    func updateLetter(id:String,letter:Letter,token:String) -> Completable {
        let parameter:[String:Any] = ["who":letter.who,
                                      "title":letter.title,
                                      "message":letter.text,
                                      "pic_name":letter.imageUrl,
                                      "open_time":letter.openTime,
                                      "open_place_name":letter.openPlaceName,
                                      "open_place_latitude":letter.latitude,
                                      "open_place_longitude":letter.longitude,
                                      "public":"0",
                                      "token":token]
        return APIClient.shared.requestCompletable(PostAPI.update(id: id, token: token, dic: parameter))
    }
    


}

