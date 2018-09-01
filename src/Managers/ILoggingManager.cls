/*------------------------------------------------------------------------
    File        : IErrorManager
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
using Progress.Lang.Error.

interface Managers.ILoggingManager:  
    method public void LogMessage(input pcMessage as character, input pcGroup as character).  
    method public void LogError(input poError as Error, input pcGroup as character).
end interface.