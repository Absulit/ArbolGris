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
class net.absulit.arbolgris.data.Parameters extends Dispatcher{
	private var _vars:LoadVars;
	//private var _target:LoadVars;
	private var _url:String;
	private var _method:String;
	public function Parameters(url:String) {
		super();
		_url = url;
		init();
	}
	
	private function init():Void {
		_vars = new LoadVars();
		_vars[Constants.PARENT] = this;
		//_target = new LoadVars();
		_vars.onLoad = onLoadTarget;
		_method = "GET";
	}
	private function onLoadTarget(success:Boolean):Void {
		if (success) {
			this[Constants.PARENT].dispatchEvent(new Event(Event.COMPLETE, this));
		}else {
			this[Constants.PARENT].dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, this));
		}
	}
	
	
	public function get vars():LoadVars {
		return _vars;
	}
	public function set vars(value:LoadVars):Void {
		_vars = value;
	}
	public function set method(value:String):Void {
		_method = value;
	}
	
	public function load():Void {
		_vars.sendAndLoad(_url, _vars, _method);
	}
	
}