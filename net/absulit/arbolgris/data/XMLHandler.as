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

import net.absulit.arbolgris.Constants;
import net.absulit.arbolgris.events.Dispatcher;
import net.absulit.arbolgris.events.ErrorEvent;
import net.absulit.arbolgris.events.Event;
/**
 * ...
 * @author Sebastian Sanabria Diaz
 */
class net.absulit.arbolgris.data.XMLHandler extends Dispatcher{
	private var _xml:XML;
	private var _path:String;
	public function XMLHandler() {
		super();
		_xml = new XML();
		_xml[Constants.PARENT] = this;
		_xml.ignoreWhite = true;
		_xml.onLoad = onLoad;
		
	}
	
	function onLoad(success):Void {
		if (success) {
			this[Constants.PARENT].dispatchEvent(new Event(Event.COMPLETE, this[Constants.PARENT]));
		}else {
			this[Constants.PARENT].dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, this[Constants.PARENT]));
		}
	}
	
	public function get path():String {
		return _path;
	}
	public function set path(value:String):Void {
		_path = value;
		_xml.load(_path);
	}
	public function get xml():XML {
		return _xml;
	}
	
}