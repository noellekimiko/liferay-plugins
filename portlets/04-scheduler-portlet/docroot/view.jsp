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

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1> AlloyUI - Scheduler </h1>

<div id="portlet04_wrapper">
	<div id="portlet04_myScheduler"></div>
</div>

<aui:script use="aui-scheduler">
	var events = [
		{
			content: 'Symposium Workshop',
			endDate: new Date(2014, 9, 19, 18),
			startDate: new Date(2014, 9, 19, 16)
		},
		{
			content: 'Symposium Workshop',
			endDate: new Date(2014, 9, 20, 15),
			startDate: new Date(2014, 9, 20, 14)
		}
	];

	var agendaView = new A.SchedulerAgendaView();
	var dayView = new A.SchedulerDayView();
	var monthView = new A.SchedulerMonthView();
	var weekView = new A.SchedulerWeekView();

	var eventRecorder = new A.SchedulerEventRecorder();

	new A.Scheduler(
		{
			boundingBox: '#portlet04_scheduler',
			date: new Date(2014, 9, 19),
			eventRecorder: eventRecorder,
			items: events,
			render: true,
			views: [dayView, weekView, monthView, agendaView]
		}
	);
</aui:script>