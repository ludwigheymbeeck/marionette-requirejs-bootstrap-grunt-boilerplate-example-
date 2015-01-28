/*global define */

define([
	'marionette',
    'js/views/MenuItemView'
], function (Marionette, MenuItemView) {
	'use strict';

	return Marionette.CollectionView.extend({
        childView: MenuItemView,
        tagName: 'ul',
        className: 'nav nav-pills pull-right'
	});

});
