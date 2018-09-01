/*------------------------------------------------------------------------
    File        : ErrorManager
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.IErrorManager.

class Managers.ErrorManager implements IErrorManager: 

	method public void AddError( input poError as Progress.Lang.Error ):
	end method.

	method public integer GetErrors( output poError as Progress.Lang.Error extent ):
	end method.

end class.