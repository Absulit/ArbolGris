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
	
import net.absulit.arbolgris.events.Event;
/**
 * ...
 * @author Sebastian Sanabria Diaz
 */
class net.absulit.arbolgris.events.ProgressEvent extends Event {
	public static var PROGRESS:String = "progress";
	private var _bytesLoaded:Number;
	private var _bytesTotal:Number;
	private var _percent:Number;
	public function ProgressEvent(type:String, target:Object) {
		super(type, target);		
	}
	
    public function clone():Event{
        return new ProgressEvent(_type,_target);
    }
	
    public function toString():String{
        return "ProgressEvent{_type:"+_type+"_target:"+_target+"}";
    }
	public function get bytesLoaded():Number {
		return _bytesLoaded;
	}
	public function set bytesLoaded(value:Number):Void {
		_bytesLoaded = value;
	}
	public function get bytesTotal():Number {
		return _bytesTotal;
	}
	public function set bytesTotal(value:Number):Void {
		_bytesTotal = value;
	}
	public function get percent():Number {
		return _percent;
	}
	public function set percent(value:Number):Void {
		_percent = value;
	}

 

}