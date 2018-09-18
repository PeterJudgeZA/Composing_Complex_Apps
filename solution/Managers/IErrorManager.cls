/*------------------------------------------------------------------------
    File        : IErrorManager
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/

interface Managers.IErrorManager:  
    method public void AddError(input poError as Progress.Lang.Error).
    method public integer GetErrors(output poError as Progress.Lang.Error extent).
end interface.