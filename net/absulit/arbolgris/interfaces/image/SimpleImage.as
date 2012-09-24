  /**
	ArbolNegro - actionscript3 multipurpose code
    Copyright (C) 2012  Sebastián Sanabria Díaz - arbolnegro.absulit.net - arbolnegroaAS3@gmail.com - admin@absulit.net

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */

import mx.events.EventDispatcher;
import net.absulit.arbolgris.Constants;
import net.absulit.arbolgris.events.Event;
import net.absulit.arbolgris.events.ProgressEvent;
/**
 * ...
 * @author Sebastian Sanabria Diaz
 */
class net.absulit.arbolgris.interfaces.image.SimpleImage extends MovieClip{
	//private var _onComplete:Function;
	private var _onProgress:Function;
	private var _path:String;
	private var _image:MovieClip;
	private var _mcl:MovieClipLoader;
	private var _listener:Object;
	public function SimpleImage(name:String, swfRoot:MovieClip) {
		_image = swfRoot.createEmptyMovieClip(name, swfRoot.getNextHighestDepth());
		_image.forceSmoothing = true;
		_mcl = new MovieClipLoader();
		_listener = new Object();
		_listener[Constants.PARENT] = this;
		_listener.onLoadComplete = onComplete;
		_listener.onLoadProgress = onProgress;
		_mcl.addListener(_listener);
		EventDispatcher.initialize(this);
	}

	public function dispatchEvent(){}
	public function addEventListener(){}
	public function removeEventListener() { }	
	
	private function onComplete():Void {
		this[Constants.PARENT].dispatchEvent(new Event(Event.COMPLETE, this[Constants.PARENT])); 
	}
	
	private function onProgress(mc:MovieClip, loadedBytes:Number, totalBytes:Number):Void {
		var progressEvent:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS, this[Constants.PARENT]);
		progressEvent.bytesLoaded = loadedBytes;
		progressEvent.bytesTotal = totalBytes;
		progressEvent.percent = loadedBytes / totalBytes;
		this[Constants.PARENT].dispatchEvent(progressEvent);
	}
	
	public function get path():String {
		return _path;
	}
	public function set path(value:String):Void {
		_path = value;
		_mcl.loadClip(_path, _image);
	}
	public function get image():MovieClip {
		return _image;
	}
}