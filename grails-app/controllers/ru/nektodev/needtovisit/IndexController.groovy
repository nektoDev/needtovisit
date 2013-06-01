package ru.nektodev.needtovisit

class IndexController {

    def index() {
        [placeInstanceList: Place.list(), placeInstanceTotal: Place.count()]
    }
}
