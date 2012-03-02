package infiando



import org.junit.*
import grails.test.mixin.*

@TestFor(TicketOrderController)
@Mock(TicketOrder)
class TicketOrderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ticketOrder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ticketOrderInstanceList.size() == 0
        assert model.ticketOrderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ticketOrderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ticketOrderInstance != null
        assert view == '/ticketOrder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ticketOrder/show/1'
        assert controller.flash.message != null
        assert TicketOrder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ticketOrder/list'


        populateValidParams(params)
        def ticketOrder = new TicketOrder(params)

        assert ticketOrder.save() != null

        params.id = ticketOrder.id

        def model = controller.show()

        assert model.ticketOrderInstance == ticketOrder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ticketOrder/list'


        populateValidParams(params)
        def ticketOrder = new TicketOrder(params)

        assert ticketOrder.save() != null

        params.id = ticketOrder.id

        def model = controller.edit()

        assert model.ticketOrderInstance == ticketOrder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ticketOrder/list'

        response.reset()


        populateValidParams(params)
        def ticketOrder = new TicketOrder(params)

        assert ticketOrder.save() != null

        // test invalid parameters in update
        params.id = ticketOrder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ticketOrder/edit"
        assert model.ticketOrderInstance != null

        ticketOrder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ticketOrder/show/$ticketOrder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ticketOrder.clearErrors()

        populateValidParams(params)
        params.id = ticketOrder.id
        params.version = -1
        controller.update()

        assert view == "/ticketOrder/edit"
        assert model.ticketOrderInstance != null
        assert model.ticketOrderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ticketOrder/list'

        response.reset()

        populateValidParams(params)
        def ticketOrder = new TicketOrder(params)

        assert ticketOrder.save() != null
        assert TicketOrder.count() == 1

        params.id = ticketOrder.id

        controller.delete()

        assert TicketOrder.count() == 0
        assert TicketOrder.get(ticketOrder.id) == null
        assert response.redirectedUrl == '/ticketOrder/list'
    }
}
