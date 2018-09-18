/*------------------------------------------------------------------------
    File        : ISupportLogManager
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
using Managers.ILoggingManager.

interface Managers.ISupportLogging:  
    define public property LogMgr as ILoggingManager no-undo get. set.  
end interface.