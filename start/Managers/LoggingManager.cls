/*------------------------------------------------------------------------
    File        : LoggingManager
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Wed May 20 10:04:07 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Progress.Lang.Error.

class Managers.LoggingManager:
  method public void LogMessage(input pcMessage as character, input pcGroup as character):
          
  end method. 

  method public void LogError(input poError as Error):
          
  end method. 

end class.