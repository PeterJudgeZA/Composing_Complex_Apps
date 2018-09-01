/*------------------------------------------------------------------------
    File        : ISupportErrorHandling
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
using Managers.*.

interface Managers.ISupportErrorHandling:  
    define public property ErrMgr as IErrorManager no-undo get. set.  
end interface.
