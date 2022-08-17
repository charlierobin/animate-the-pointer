#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  for i as Integer = 1 to 7
		    
		    var p as Picture = Picture.Open( SpecialFolder.Resources.Child( "frame_" + i.ToString() + ".png" ) )
		    
		    me.cursors.Add( new MouseCursor( p, 9, 15 ) )
		    
		  next
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub refreshCursorNow()
		  if me.t <> nil then
		    
		    me.MouseCursor = me.cursors( me.index )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startCursorCount()
		  if me.t is nil then
		    
		    me.t = new Timer()
		    
		    me.t.Period = 1000
		    
		    me.t.RunMode = Timer.RunModes.Multiple
		    
		    me.index = 0
		    
		    AddHandler me.t.Action, AddressOf me.updateCursor
		    
		    // action "updateCursor" only first called after period has elapsed, so immediately set cursor here
		    
		    me.refreshCursorNow()
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopCursorCount()
		  me.t = nil
		  
		  me.MouseCursor = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateCursor(t as Timer)
		  me.index = me.index + 1
		  
		  if me.index > me.cursors.LastIndex then
		    
		    me.index = 0
		    
		  end if
		  
		  me.refreshCursorNow()
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cursors() As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private index As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private t As Timer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
