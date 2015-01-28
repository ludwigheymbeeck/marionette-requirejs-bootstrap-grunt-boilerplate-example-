/*global define */

define([
	'backbone',
	'js/models/Page'
], function (Backbone, Page) {
	'use strict';

	return Backbone.Collection.extend({
		model: Page
	});
});
