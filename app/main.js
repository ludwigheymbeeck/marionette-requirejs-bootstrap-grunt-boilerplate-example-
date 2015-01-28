require([
	'app',
    'js/modules/Pages',
    'jquery',
	'bootstrap'
], function (app, PagesModule) {
	'use strict';

    app.addInitializer(function() {
        PagesModule.start();
    });

	app.start();
});