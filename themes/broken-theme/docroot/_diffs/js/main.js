AUI().ready(
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'liferay-sign-in-modal', 'aui-modal',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('#breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		A.getBody().delegate('click', eventHandler, 'a.logo');

		var eventHandler = function(event) {
			event.preventDefault();
			alert(event.currentTarget.attr('title'));
		};

		var signIn = A.one('li.sign-in a');

		if (signIn && signIn.getData('redirect') !== 'true') {
			signIn.plug(Liferay.SignInModal);
		}

		A.getBody().delegate('click', modalShow, '.breadcrumb');

		var modal = new A.Modal(
			{
				bodyContent: 'Sign in Here',
				centered: true,
				headerContent: '<h3>Sign In</h3>',
				modal: true,
				render: '#modal-sign-in',
				visible: false
			}
		).render();

		var modalShow = function(event) {
			event.preventDefault();
			modal.show();
		};

		A.getBody().delegate('click', openSiteInDialog, '#powered-by-link');

		var openSiteInDialog = function(event) {
			Liferay.Util.openInDialog(event, event.currentTarget);
		}
	}
);