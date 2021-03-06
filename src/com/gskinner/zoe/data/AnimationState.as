/*
* Zoë by gskinner.com.
* Visit www.gskinner.com/blog for documentation, updates and more free code.
*
* Copyright (c) 2010 Grant Skinner
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/

package com.gskinner.zoe.data {
	
	/**
	 * Defines a individual animation state, as created by CaptureSWF.
	 * 
	 * @see com.gskinner.animationcapture.getStates
	 * 
	 */
	public class AnimationState {
		
		/**
		 * Name of the state, as defined in the source swf file.
		 * 
		 */
		public var name:String;
		
		/**
		 * The start of this state.
		 * 
		 */
		public var startFrame:uint;
		
		/**
		 * End frame for this animation.
		 * This value is auto-generated based on:
		 * a) The start of a new sequence
		 * or
		 * b) An empty keyframe
		 * 
		 */
		public var endFrame:uint;
		
		protected var _actions:Object;
		
		/**
		 * Creates a new AnimtaionState instance.
		 * 
		 * @param name The name of this state, defined on the timeline by the loaded swf.
		 * @param startFrame The 0 based start frame of this state.
		 * @param endFrame The 0 based end frame of this state.
		 * 
		 */
		public function AnimationState(name:String, startFrame:uint, endFrame:uint) {
			this.name = name;
			this.startFrame = startFrame;
			this.endFrame = endFrame;
			
			_actions = {};
		}
		
		public function get frequency():Number {
			return isNaN(_actions.frequency)?NaN:Number(_actions.frequency);
		}
		
		public function get next():String {
			return _actions.next;
		}
		
		
		public function addActions(value:Object):void {
			for (var n:String in value) {
				if (n == "label") { continue; }
				_actions[n] = value[n];
			}
		}
	}
}