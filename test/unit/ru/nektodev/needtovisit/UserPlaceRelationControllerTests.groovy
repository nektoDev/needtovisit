package ru.nektodev.needtovisit



import org.junit.*
import grails.test.mixin.*

@TestFor(UserPlaceRelationController)
@Mock(UserPlaceRelation)
class UserPlaceRelationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userPlaceRelation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userPlaceRelationInstanceList.size() == 0
        assert model.userPlaceRelationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userPlaceRelationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userPlaceRelationInstance != null
        assert view == '/userPlaceRelation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userPlaceRelation/show/1'
        assert controller.flash.message != null
        assert UserPlaceRelation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userPlaceRelation/list'

        populateValidParams(params)
        def userPlaceRelation = new UserPlaceRelation(params)

        assert userPlaceRelation.save() != null

        params.id = userPlaceRelation.id

        def model = controller.show()

        assert model.userPlaceRelationInstance == userPlaceRelation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userPlaceRelation/list'

        populateValidParams(params)
        def userPlaceRelation = new UserPlaceRelation(params)

        assert userPlaceRelation.save() != null

        params.id = userPlaceRelation.id

        def model = controller.edit()

        assert model.userPlaceRelationInstance == userPlaceRelation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userPlaceRelation/list'

        response.reset()

        populateValidParams(params)
        def userPlaceRelation = new UserPlaceRelation(params)

        assert userPlaceRelation.save() != null

        // test invalid parameters in update
        params.id = userPlaceRelation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userPlaceRelation/edit"
        assert model.userPlaceRelationInstance != null

        userPlaceRelation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userPlaceRelation/show/$userPlaceRelation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userPlaceRelation.clearErrors()

        populateValidParams(params)
        params.id = userPlaceRelation.id
        params.version = -1
        controller.update()

        assert view == "/userPlaceRelation/edit"
        assert model.userPlaceRelationInstance != null
        assert model.userPlaceRelationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userPlaceRelation/list'

        response.reset()

        populateValidParams(params)
        def userPlaceRelation = new UserPlaceRelation(params)

        assert userPlaceRelation.save() != null
        assert UserPlaceRelation.count() == 1

        params.id = userPlaceRelation.id

        controller.delete()

        assert UserPlaceRelation.count() == 0
        assert UserPlaceRelation.get(userPlaceRelation.id) == null
        assert response.redirectedUrl == '/userPlaceRelation/list'
    }
}
