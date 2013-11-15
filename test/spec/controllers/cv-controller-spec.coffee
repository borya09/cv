'use strict'


class CvControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (CvService) ->
      @cvService = CvService
      spyOn(@cvService, 'get').andCallThrough()

      @cv = fixtures.cv.a
      @httpBackend.whenGET(/config.json/).respond fixtures.config.a
      @httpBackend.whenGET(/cv_en.json/).respond fixtures.cv.a

      @CvCtrl = @controller 'CvCtrl', {
        $scope: @scope
        CvService: @cvService
      }

      do @httpBackend.flush


    describe 'initialization', ->

      it 'should call \'cvService.get\' method', () ->
        expect(@cvService.get).toHaveBeenCalled()

      it 'should attach the cv to the scope', () ->
        expect(@scope.cv.length).toBe 2
        part1 = @scope.cv[0]
        expect(part1 instanceof CvPart).toBeTruthy()
        expect(part1.title).toBe 'Sección 1'
        expect(part1.content).toBe 'contenido de la sección 1'

    describe '\'locale_changed\' event broadcasted', ->
      beforeEach ->
        @rootScope.$broadcast('locale_changed')
        do @httpBackend.flush

      it 'should call \'cvService.get\' method', () ->
        expect(@cvService.get).toHaveBeenCalled()



    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest


describe 'Controller: CvCtrl', () -> do new CvControllerSpec().test


