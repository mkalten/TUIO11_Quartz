/*
 TUIO Quartz Composer Plugin - part of the reacTIVision project
 http://reactivision.sourceforge.net/
 
 Copyright (c) 2005-2016 Martin Kaltenbrunner <martin@tuio.org>
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files
 (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge,
 publish, distribute, sublicense, and/or sell copies of the Software,
 and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 Any person wishing to distribute modifications to the Software is
 requested to send the modifications to the original developer so that
 they can be incorporated into the canonical version.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import "QuartzTuioClient.h" 
#import "QuartzTuioListener.h" 
#import "TuioClient.h"

using namespace TUIO;

@implementation QuartzTuioClient- (id)init:(int)port
{
if (self = [super init])
{
	running = false;
	TuioClient *client = new TuioClient(port);
	_client = (void *)client;
	udp_port = port;
}
return self;
}
- (void)dealloc 
{
	TuioClient *client = (TuioClient*)_client;
	if (client!=NULL) delete client;
	[super dealloc];
}
- (void)start 
{
	if (running) return;
	
	TuioClient *client = (TuioClient *)_client;
	if (client!=NULL) {
		client->connect();
		if (client->isConnected()) {
			NSLog( @"TuioClient started listening to port %i",udp_port);
			running=true;
		} else  NSLog( @"TuioClient failed to bind to port %i",udp_port);

	}
}
- (void)stop
{
	if (!running) return;
	
	TuioClient *client = (TuioClient *)_client;
	if (client!=NULL) {
		client->disconnect();
		NSLog( @"TuioClient stopped listening to port %i",udp_port);
		running=false;
	}
}
- (bool)isRunning
{
	return running;
}
- (void)addTuioListener:(TuioPlugIn *)plugin
{
TuioListener *listener = new QuartzTuioListener((void*)plugin);
((TuioClient *)_client)->addTuioListener(listener);
_listener = (void *)listener;
}
- (void)removeTuioListener
{
TuioListener *listener = (TuioListener *)_listener;
((TuioClient *)_client)->removeTuioListener(listener);
delete listener;
}

@end

