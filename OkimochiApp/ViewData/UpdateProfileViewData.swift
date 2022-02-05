struct UpdateProfileViewData {
    private let user: User
    private let sections: UpdateProfileSection

    init(user: User, sectons: UpdateProfileSection) {
        self.user = user
        self.sections = sectons
    }
}
