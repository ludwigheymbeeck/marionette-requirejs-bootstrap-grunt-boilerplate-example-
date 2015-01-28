/*global define */

define([
    'backbone',
	'marionette',
    'js/regions/notification',
    'js/regions/dialog',
	'js/collections/Nav',
	'js/views/MenuView',
	'js/views/Footer'
], function (Backbone, Marionette, NotifyRegion, DialogRegion, Nav, MenuView, Footer) {
	'use strict';

	var app = new Marionette.Application();

    app.pages = new Nav([
        {title: 'Home', name: 'home', active: true},
        {title: 'About', name: 'about'},
        {title: 'Contact', name: 'contact'}
    ]);
    var menu = new MenuView({collection: app.pages});

	app.addRegions({
		menu: '#main-nav',
		main: '#main',
		footer: '#footer',
        notification: {
            selector: "#notification",
            regionClass: NotifyRegion
        },
        dialog: {
            selector: "#dialog",
            regionClass: DialogRegion
        }
	});

	app.addInitializer(function () {
        app.menu.show(menu);
		app.footer.show(new Footer());
	});

    app.on("start", function(options){
        if (Backbone.history){
            Backbone.history.start();
        }
		if(Backbone.history.fragment === '') {
			Backbone.history.navigate('/page/home');
		}
    });

	app.vent.on('menu:activate', function (activePageModel) {
        menu.collection.findWhere({active: true})
            .set('active', false);
        activePageModel.set('active', true);
        menu.render();
	});

    /**
     * Sample JSON Data
     * app.commands.execute("app:notify", {
     *           type: 'warning'    // Optional. Can be info(default)|danger|success|warning
     *           title: 'Success!', // Optional
     *           description: 'We are going to remove Team state!'
     *       });
     */
    app.commands.setHandler("app:notify", function(jsonData) {
        require(['js/views/NotificationView'], function(NotifyView) {
            app.notification.show(new NotifyView({
                model: new Backbone.Model(jsonData)
            }));
        });
    });

    /**
     * @example
     * app.commands.execute("app:dialog:simple", {
     *           icon: 'info-sign'    // Optional. default is (glyphicon-)bell
     *           title: 'Dialog title!', // Optional
     *           message: 'The important message for user!'
     *       });
     */
    app.commands.setHandler("app:dialog:simple", function(data) {
        require(['js/views/DialogView', 'js/models/Dialog', 'tpl!templates/simpleModal.html'],
            function(DialogView, DialogModel, ModalTpl) {

                app.dialog.show(new DialogView({
                    template: ModalTpl,
                    model: new DialogModel(data)
                }));
            });
    });

    /**
     * @example
     * app.commands.execute("app:dialog:confirm", {
     *           icon: 'info-sign'    // Optional. default is (glyphicon-)bell
     *           title: 'Dialog title!', // Optional
     *           message: 'The important message for user!'
     *           'confirmYes': callbackForYes, // Function to execute of Yes clicked
     *           'confirmNo': callbackForNo, // Function to execute of No clicked
     *       });
     */
    app.commands.setHandler("app:dialog:confirm", function(data) {
        require(['js/views/DialogView', 'js/models/Dialog', 'tpl!templates/confirmModal.html'],
            function(DialogView, DialogModel, ModalTpl) {

                app.dialog.show(new DialogView({
                    template: ModalTpl,
                    model: new DialogModel(data),
                    events: {
                        'click .dismiss': 'dismiss',
                        'click .confirm_yes': data.confirmYes,
                        'click .confirm_no': data.confirmNo
                    }
                }));
            });
    });

	return window.app = app;
});
