---
title: 'iOS6 forced me to do it'
permalink: /coding/:title
---
Back in the dark days when the web was created, everything was synchronous. As we have moved into
the great new world of asynchronous requests and responses, file uploads have lagged forever behind.
Uploading required a form; forms redirect upon submit completion; redirection is bad for a
single-page app. Enter: the iframe hack.

The old-school HTML looked like:

	<form action="<upload handler>" enctype="multipart/form-data" method="post">
		<input type="file" name="file" />
	</form>	

Upon completion, the response from the upload handler would be displayed. To get around this, you
could target an invisible iframe, completely hiding the response from the user:

	<iframe id="upload_target" style="display:none;width:0;height:0"></iframe>
	<form action="my-upload-handler" target="upload_target" enctype="multipart/form-data" method="post">
		<input type="file" name="file" />
	</form>

Awesome! No redirects! Except that iOS 6 recently rolled around and (finally) added (image) file
upload support in iOS Safari. Our app using the iframe hack? Not playing well at all. The specifics
escape my memory, but combining a long-polling connection (comet) with file uploads resulted in
either a delay until the long-poll channel closed (over http) or an upload that never happened (over
https).

To work around this little niggle on iOS, I ended up having to embrace [XHR2][1]. iOS 6 actually
*forced me to adopt a non-hack*. The following Javascript will upload the given form:

	function sendForm(form) {
		var formData = new  For	mData(form);
		var req = new XMLHttpRequest();
		req.open("POST", "<upload handler>");
		req.send(formData);
		return req;
	}

Granted, the iframe hack still exists in our application for IE7 and IE8 users, but real browsers
are now using asynchronous file uploads (and our app is cleaner for it).

 [1]: http://www.w3.org/TR/XMLHttpRequest/
