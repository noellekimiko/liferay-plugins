<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1> AlloyUI - Scheduler </h1>

<div id="portlet04_wrapper">
	<div id="portlet04_myScheduler"></div>
</div>

<aui:script>
	YUI().use(
		'aui-scheduler',
		function(Y) {
			var events = [
				{
					content: 'Fourth of July Picnic',
					endDate: new Date(2014, 6, 4, 18),
					startDate: new Date(2014, 6, 4, 13)
				},
				{
					content: 'Tracey\'s birthday',
					endDate: new Date(2014, 6, 6, 23, 59),
					startDate: new Date(2014, 6, 6, 0)
				}
			];

			var dayView = new Y.SchedulerDayView();
			var weekView = new Y.SchedulerWeekView();
			var monthView = new Y.SchedulerMonthView();
			var agendaView = new Y.SchedulerAgendaView();

			var eventRecorder = new Y.SchedulerEventRecorder();

			new Y.Scheduler(
				{
					activeView: monthView,
					boundingBox: '#portlet04_myScheduler',
					date: new Date(2014, 6, 3),
					eventRecorder: eventRecorder,
					items: events,
					render: true,
					views: [dayView, weekView, monthView, agendaView]
				}
			);
		}
	);
</aui:script>