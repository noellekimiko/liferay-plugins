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

		var signIn = A.one('li.sign-in a');

		if (signIn && signIn.getData('redirect') !== 'true') {
			signIn.plug(Liferay.SignInModal);
		}

		var eventHandler = function(event) {
			event.preventDefault();
			alert(event.currentTarget.attr('title'));
		};

		A.getBody().delegate('click', eventHandler, 'a.logo');

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

		A.getBody().delegate('click', modalShow, '.breadcrumb');

		var openSiteInDialog = function(event) {
			Liferay.Util.openInDialog(event, event.currentTarget);
		}

		A.getBody().delegate('click', openSiteInDialog, '#powered-by-link');
	}
);