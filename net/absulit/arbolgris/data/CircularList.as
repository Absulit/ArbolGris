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
dynamic class net.absulit.arbolgris.data.CircularList extends Array{
	private var _item:Object;
	private var _page:Array;
	private var _pages:Array;
	private var _numPages:Number;
	private var _numPageItems:Number;		
	private var _itemIndex:Number;
	private var _pageIndex:Number;
	
	public function CircularList() {
		super();
		init();
	}
	
	private function init():Void {
		_item = null;
		_page = null;
		_pages = null;
		_numPages = 0;
		_numPageItems = 0;
		_itemIndex = 0;
		_pageIndex = 0;
		
	}
	
	/**
	 * The current item defined by itemIndex
	 */
	public function get item():Object { return  this[_itemIndex]; }
	
	public function set item(value:Object):Void {
		this[_itemIndex] = _item = value;
	}
	
	/**
	 * The current page defined by pageIndex
	 */
	public function get page():Array { 
		_page = new Array();
		var initIndex:Number = _pageIndex * _numPageItems;
		var finalIndex:Number = initIndex + _numPageItems
		for (var k:Number = initIndex; k <  finalIndex ; k++ ) {
			_page.push(this[k])
		}
		return _page;	
	}
	
	public function set page(value:Array):Void {
		//TODO: sizes must match
		_page = value;
	}

	/**
	 * Array with pages (each page with items)
	 */
	public function get pages():Array { return _pages; }
	
	public function set pages(value:Array):Void {
		_pages = value;
	}
	/**
	 * The number of pages stablished by the user
	 */
	public function get numPages():Number { return _numPages; }
	
	public function set numPages(value:Number):Void {
		_numPages = value;
		//TODO: arreglar esto
		_numPageItems = value;
		_numPages = this.length / _numPageItems;
		if (this.length % _numPageItems != 0){
			_numPages++;
		}
	}
	/**
	 * The number of items per page stablished by the user
	 */
	public function get numPageItems():Number { return _numPageItems; }
	
	public function set numPageItems(value:Number):Void {
		_numPageItems = value;
		_numPages = this.length / _numPageItems;
		if (this.length % _numPageItems != 0){
			_numPages++;
		}
	}
	/**
	 * Current item index that can be lower from zero, or greater than length;
	 * the index is self-correcting
	 */
	public function get itemIndex():Number { return _itemIndex; }
	
	public function set itemIndex(value:Number):Void {
		_itemIndex = value;
		//TODO:cambiar por _itemIndex = _itemIndex % this.length
		if (_itemIndex > this.length - 1) {
			while (_itemIndex > this.length - 1) {
				_itemIndex -= this.length;
			}
		}else if(_itemIndex < 0){
			while (_itemIndex < 0 && _itemIndex < this.length) {
				_itemIndex += this.length;
			}
		}			
		//_item = this[_itemIndex];			
	}
	/**
	 * Current page index
	 */
	public function get pageIndex():Number { return _pageIndex; }

	public function set pageIndex(value:Number):Void {
		_pageIndex = value;
		
		if (_pageIndex > _numPages - 1) {
			while (_pageIndex > _numPages- 1) {
				_pageIndex -= _numPages;
			}
		}else if(_pageIndex < 0){
			while (_pageIndex < 0 && _pageIndex < _numPages) {
				_pageIndex += _numPages;
			}
		}
		
		itemIndex = _pageIndex * _numPageItems;
	}
	
	/**
	 * The next item and updates itemIndex
	 * @return the item in the next position
	 */
	public function next():Object{
		++itemIndex;
		return this[_itemIndex];
	}
	/**
	 * The previous item and updates itemIndex
	 * @return the item in the previous position
	 */
	public function previous():Object{
		--itemIndex;
		return this[_itemIndex];
	}
	
	/**
	 * Return the firs item
	 * @return the item in the first position
	 */
	public function first():Object{
		return this[0];
	}
	
	/**
	 * Returns the last item in CircularList
	 * @return the iten in the last position
	 */
	public function last():Object{
		return this[this.length - 1];
	}
	
	/**
	 * Returns the index of param value
	 * @param	value item to find index
	 * @return -1 if not exists or the index of value
	 */
	public function indexOfItem(value:Object):Number {
		var item:Object;
		var index:Number = -1;
		for (var k:Number = 0; k < this.length; k++) {
			item = this[k];
			if (item == value) {
				index = k;
				break;
			}
		}
		return index;
	}
	
	public function hasItem(value:Object):Boolean {
		var exists:Boolean = false;
		var item:Object;
		for (var k:Number = 0; k < this.length; k++ ) {
			item = this[k];
			if (item == value) {
				exists = true;
				break;
			}
		}
		return exists;
	}
	
}