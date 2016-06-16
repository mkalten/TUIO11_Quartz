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

#import <Quartz/Quartz.h>
#import <Foundation/NSHashTable.h>

@interface TuioPlugIn : QCPlugIn
{
	@private
	void *_client;
	NSUInteger _udpPort;
	
	NSMutableDictionary *objectList;
	NSMutableDictionary *cursorList;
	NSMutableDictionary *blobList;

	NSNumber *lockObjectList;
	NSNumber *lockCursorList;
	NSNumber *lockBlobList;
	
	float ratio;
}

- (void)addTuioObject:(int)s_id :(int)f_id :(float)xpos :(float)ypos :(float)angle;
- (void)updateTuioObject:(int)s_id :(int)f_id :(float)xpos :(float)ypos :(float)angle :(float)xspeed :(float)yspeed :(float)rspeed :(float)maccel :(float)raccel;
- (void)removeTuioObject:(int)s_id :(int)f_id;

- (void)addTuioCursor:(int)s_id :(int)c_id :(float)xpos :(float)ypos;
- (void)updateTuioCursor:(int)s_id :(int)c_id :(float)xpos :(float)ypos :(float)xspeed :(float)yspeed :(float)maccel;
- (void)removeTuioCursor:(int)s_id :(int)c_id;

- (void)addTuioBlob:(int)s_id :(int)b_id :(float)xpos :(float)ypos :(float)angle :(float)width :(float)height :(float)area;
- (void)updateTuioBlob:(int)s_id :(int)b_id :(float)xpos :(float)ypos :(float)angle :(float)width :(float)height :(float)area :(float)xspeed :(float)yspeed :(float)rspeed :(float)maccel :(float)raccel;
- (void)removeTuioBlob:(int)s_id :(int)b_id;

@property(assign) NSArray* outputObjects;
@property(assign) NSArray* outputCursors;
@property(assign) NSArray* outputBlobs;

@end
