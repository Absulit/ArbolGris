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
/**
 * ...
 * @author Sebastian Sanabria Diaz
 */
class net.absulit.arbolgris.events.Dispatcher{
	/*public var dispatchEvent:Function;
	public var addEventListener:Function;
	public var removeEventListener:Function;*/
	public function Dispatcher() {
		EventDispatcher.initialize(this);
	}
	public function dispatchEvent(){}
	public function addEventListener(){}
	public function removeEventListener(){}
}