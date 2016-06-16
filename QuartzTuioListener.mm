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

#include "QuartzTuioListener.h"
#include "TuioPlugIn.h"

void QuartzTuioListener::addTuioObject(TuioObject *tobj) {
	//std::cout << "add obj " << tobj->getSymbolID() << " (" << tobj->getSessionID() << ") "<< tobj->getX() << " " << tobj->getY() << " " << tobj->getAngleDegrees() << std::endl;
	[(TuioPlugIn*)_plugin addTuioObject:tobj->getSessionID():tobj->getSymbolID():tobj->getX():tobj->getY():tobj->getAngleDegrees()];
}

void QuartzTuioListener::updateTuioObject(TuioObject *tobj) {
	//std::cout << "set obj " << tobj->getSymbolID() << " (" <<  tobj->getSessionID() << ") "<< tobj->getX() << " " << tobj->getY() << " " << tobj->getAngleDegrees() << " " << tobj->getXSpeed()  << " " << tobj->getYSpeed()  << " " << tobj->getRotationSpeed()  << " " << tobj->getMotionAccel()  << " " << tobj->getRotationAccel() << std::endl;
	[(TuioPlugIn*)_plugin updateTuioObject:tobj->getSessionID():tobj->getSymbolID():tobj->getX():tobj->getY():tobj->getAngleDegrees():tobj->getXSpeed():tobj->getYSpeed():tobj->getRotationSpeed():tobj->getMotionAccel():tobj->getRotationAccel()];
}

void QuartzTuioListener::removeTuioObject(TuioObject *tobj) {
	//std::cout << "del obj " << tobj->getSymbolID() << " (" <<  tobj->getSessionID() << ")" << std::endl;
	[(TuioPlugIn*)_plugin removeTuioObject:tobj->getSessionID():tobj->getSymbolID()];
}

void QuartzTuioListener::addTuioCursor(TuioCursor *tcur) {
	//std::cout << "add cur " << tcur->getCursorID() << " (" <<  tcur->getSessionID() << ") "<< tcur->getX() << " " <<  tcur->getY() << " " << std::endl;
	[(TuioPlugIn*)_plugin addTuioCursor:tcur->getSessionID():tcur->getCursorID():tcur->getX():tcur->getY()];
}

void QuartzTuioListener::updateTuioCursor(TuioCursor *tcur) {
	//std::cout << "set cur " << tcur->getCursorID() << " (" <<  tcur->getSessionID() << ") "<< tcur->getX() << " " <<  tcur->getY() << " " << tcur->getXSpeed() << " " << tcur->getYSpeed() << " " << tcur->getMotionAccel() << std::endl;
	[(TuioPlugIn*)_plugin updateTuioCursor:tcur->getSessionID():tcur->getCursorID():tcur->getX():tcur->getY():tcur->getXSpeed():tcur->getYSpeed():tcur->getMotionAccel()];
}

void QuartzTuioListener::removeTuioCursor(TuioCursor *tcur) {
	//std::cout << "del cur " << tcur->getCursorID() << " (" << tcur->getSessionID() << ")" << std::endl;
	[(TuioPlugIn*)_plugin removeTuioCursor:tcur->getSessionID():tcur->getCursorID()];
}

void QuartzTuioListener::addTuioBlob(TuioBlob *tblb) {
	//std::cout << "add blb " << tblb->getBlobID() << " (" <<  tblb->getSessionID() << ") "<< tblb->getX() << " " <<  tblb->getY() << " " << std::endl;
	[(TuioPlugIn*)_plugin addTuioBlob:tblb->getSessionID():tblb->getBlobID():tblb->getX():tblb->getY():tblb->getAngle():tblb->getWidth():tblb->getHeight():tblb->getArea()];
}

void QuartzTuioListener::updateTuioBlob(TuioBlob *tblb) {
	//std::cout << "set blb " << tblb->getBlobID() << " (" <<  tblb->getSessionID() << ") "<< tblb->getX() << " " <<  tblb->getY() << " " << tblb->getXSpeed() << " " << tblb->getYSpeed() << " " << tblb->getMotionAccel() << std::endl;
	[(TuioPlugIn*)_plugin updateTuioBlob:tblb->getSessionID():tblb->getBlobID():tblb->getX():tblb->getY():tblb->getAngle():tblb->getWidth():tblb->getHeight():tblb->getArea():tblb->getXSpeed():tblb->getYSpeed():tblb->getRotationSpeed():tblb->getMotionAccel():tblb->getRotationAccel()];
}

void QuartzTuioListener::removeTuioBlob(TuioBlob *tblb) {
	//std::cout << "del blb " << tblb->getBlobID() << " (" << tblb->getSessionID() << ")" << std::endl;
	[(TuioPlugIn*)_plugin removeTuioBlob:tblb->getSessionID():tblb->getBlobID()];
}

void QuartzTuioListener::refresh(TuioTime frameTime) {
}

