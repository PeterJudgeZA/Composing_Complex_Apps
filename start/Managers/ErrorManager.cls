/*------------------------------------------------------------------------
    File        : ErrorManager
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Wed May 20 10:04:21 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Progress.Lang.Error.

class Managers.ErrorManager: 

	method public void AddError( input poError as Error ):
	end method.

	method public integer GetErrors( output poError as Error extent ):
	end method.

end class.