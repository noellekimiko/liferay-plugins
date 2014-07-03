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

<h1> AlloyUI - Registration Form </h1>

<div id="portlet06_progressBar"></div>

<div id="portlet06_pagination" class="pagination">
	<ul class="pagination-content">
		<li><a>Prev</a></li>
		<li><a>1</a></li>
		<li><a>2</a></li>
		<li><a>Next</a></li>
	</ul>
</div>

<div class="portlet06_page">
	<form id="portlet06_form1" class="portlet06_form" onSubmit="event.preventDefault();">
		<label for="portlet06_name">Name:</label>
		<input id="portlet06_name" name="portlet06_name" placeholder="Joey Bloggs" type="text"/>
		<br />
		<label for="portlet06_email">Email:</label>
		<input id="portlet06_email" name="portlet06_email" placeholder="test@liferay.com" type="text"/>
		<br />
		<label for="portlet06_date">Birthday:</label>
		<input id="portlet06_date" name="portlet06_date" placeholder="mm/dd/yyyy" type="text"/>
	</form>
</div>

<div class="hide portlet06_page">
	<form id="portlet06_form2" class="portlet06_form" onSubmit="event.preventDefault();">
		<fieldset>
			<p>Crop your headshot.</p>

			<div id="portlet06_imageCropper">
				<img id="portlet06_image" src="http://alloyui.com/image-cropper/img/crop-image.jpg"/>
			</div>
		</fieldset>

		<fieldset>
			<label for="portlet06_charInput">
				Write a description about yourself <em>(Must be less than 160 characters)</em>:
			</label>
			<br />
			<textarea name="portlet06_charInput" id="portlet06_charInput"></textarea>
			<br />
			<span id="portlet06_counter"></span> characters remaining.
		</fieldset>

		<fieldset>
			<button class ="btn" id="portlet06_submitBtn">Submit</button>
			<button class="btn" id="portlet06_resetBtn">Reset</button>
		</fieldset>

		<fieldset class="hide" id="portlet06_output">
			<legend class="fieldset-legend">
				<span class="legend">
					Output
				</span>
			</legend>

			<div id="portlet06_message"></div>
		</fieldset>
	</form>
</div>

<aui:script>
YUI().use (
	'aui-button',
	'aui-char-counter',
	'aui-datepicker',
	'aui-form-validator',
	'aui-image-cropper',
	'aui-pagination',
	'aui-progressbar',
	function(Y) {
		var formValidator = [];
		var forms = Y.all('.portlet06_form');
		var pages = Y.all('.portlet06_page');
		var output = Y.one('#portlet06_output');

		var updateProgress = function() {
			var validForms = 0;

			for (var i = 0; i < formValidator.length; i++) {
				formValidator[i].validate();

				if(!formValidator[i].hasErrors()) {
					validForms++;
				}
			}

			var ratio = Math.round(validForms/formValidator.length * 100);

			progressBar.set('value', ratio);
		};

		var progressBar = new Y.ProgressBar(
			{
				boundingBox: '#portlet06_progressBar',
				label: '0%',
				on: {
					complete: function(event) {
						this.set('label', 'Complete!');
					},
					valueChange: function(event) {
						this.set('label', event.newVal + '%');
					}
				},
				value: 0,
				width: 700
			}
		).render();

		new Y.Pagination(
			{
				after: {
					changeRequest: function(event) {
						if (event.state.page === 2 && !imgCropper.rendered) {
							imgCropper.render();

							imgCropper.rendered = true;
						}
					}
				},
				boundingBox: '#portlet06_pagination',
				circular: false,
				contentBox: '#portlet06_pagination .pagination-content',
				on: {
					changeRequest: function(event) {
						var lastState = event.lastState,
							state = event.state;

						if(lastState) {
							pages.item(lastState.page - 1).hide();

							updateProgress();
						}

						pages.item(state.page - 1).show();
					}
				},
				page: 1
			}
		).render();

		formValidator[0] = new Y.FormValidator(
			{
				boundingBox: '#portlet06_form1',
				rules: {
					portlet06_email: {
						email: true,
						required: true
					},
					portlet06_name: {
						alpha: true,
						required: true
					}
				}
			}
		);

		formValidator[1] = new Y.FormValidator(
			{
				boundingBox: '#portlet06_form2',
				fieldStrings: {
					portlet06_charInput: 'Words must be between 1 and 160 characters.'
				},
				rules: {
					portlet06_charInput: {
						rangeLength: [1, 160],
						required: true
					}
				}
			}
		);

		new Y.Button(
			{
				on: {
					click: function() {
						updateProgress();

						var validForms = 0;

						var formValidatorLength = formValidator.length;

						for (var i = 0; i < formValidatorLength; i++) {
							if (!formValidator[i].hasErrors()) {
								validForms++;
							}
						}

						if (validForms != formValidatorLength) {
							validForms = 0;
						}

						generateOutput(validForms);
					}
				},
				srcNode: '#portlet06_submitBtn'
			}
		).render();

		var generateOutput = function(valid) {
			var messageNode = Y.one('#portlet06_message');
			var outputNode = Y.one('#portlet06_output');

			var cssClass = valid ? "text-success" : "text-error";
			var messageString = valid ? "All forms are complete!" : "Please fill out the entire form!";

			var message = Y.Node.create("<div class='" + cssClass + "'>" + messageString + "</div>");

			messageNode.setHTML(message);

			outputNode.show();
		};

		new Y.Button(
			{
				on: {
					click: function() {
						location.reload();
					}
				},
				srcNode: '#portlet06_resetBtn'
			}
		).render();

		new Y.DatePicker(
			{
				on: {
					selectionChange: function(event) {
						console.log(event.newSelection)
					}
				},
				popover: {
					zIndex: 1
				},
				trigger: '#portlet06_date'
			}
		);

		var charCounter = new Y.CharCounter(
			{
				counter: '#portlet06_counter',
				input: '#portlet06_charInput',
				maxLength: 160
			}
		);

		var imgCropper = new Y.ImageCropper(
			{
				srcNode: '#portlet06_image'
			}
		);
	}
);
</aui:script>