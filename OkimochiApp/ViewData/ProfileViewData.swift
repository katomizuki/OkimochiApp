
struct ProfileViewData {
    let options: ProfileFilterOptions
    let user:User
    let letter:Letter
    init(user: User,options:ProfileFilterOptions,letter:Letter) {
        self.user = user
        self.options = options
        self.letter = letter
    }
}
