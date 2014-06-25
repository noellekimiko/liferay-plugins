AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'liferay-sign-in-modal',
	'aui-audio',
	'aui-carousel',
	'aui-pagination',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('#breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var signIn = A.one('li.sign-in a');

		if (signIn && signIn.getData('redirect') !== 'true') {
			signIn.plug(Liferay.SignInModal);
		}

		var pagination = A.one('div.pagination');

		if (pagination) {

			var pages = A.all('.pages-content div');

			new A.Pagination(
				{
					boundingBox: '#pagination',
					circular: false,
					contentBox: '#pagination .pagination-content',
					on: {
						changeRequest: function(event) {
							var instance = this,
								state = event.state,
								lastState = event.lastState;

							if (lastState) {
								pages.item(lastState.page - 1).setStyle('display', 'none');
							}

							pages.item(state.page - 1).setStyle('display', 'block');
						}
					},
					page: 1
				}
			).render();
		}
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);