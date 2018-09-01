/*------------------------------------------------------------------------
    File        : LoggingManager
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.

class Managers.FileLogManager implements ILoggingManager:
    method public void LogError( input poError as Progress.Lang.Error, input pcGroup as character ):
        
    end method.

    method public void LogMessage(input pcMessage as character, input pcGroup as character):
    end method. 

end class.