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

/**
 * ...
 * @author Sebastian Sanabria Diaz
 */
class net.absulit.arbolgris.events.Event{
	public static var COMPLETE:String = "complete";
	
    private var _type:String;
    public function set type(t:String):Void{}
    public function get type():String{return _type;}
 
    private var _target:Object;
    public function set target(value:Object):Void { _target = value; }
    public function get target():Object { return _target; }
 
    public function Event(type:String,target:Object){
        _type = type;
        _target = target;
    }
 
    public function clone():Event{
        return new Event(_type,_target);
    }
	
    public function toString():String{
        return "Event{_type:"+_type+"_target:"+_target+"}";
    }

}
