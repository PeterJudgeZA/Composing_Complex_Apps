/*------------------------------------------------------------------------
    File        : CustomerDAO
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

class Services.CustomerDAO:
    constructor public CustomerDAO():
    end constructor.
     
    method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams):
        /* connect to data-source */
        /* set query string from params */
        /* fill */
        /* disconnect from data-source */
    end method.

    method public void Save(input-output dataset-handle phData, input-output dataset-handle phParams):
        /* connect to data-source */
        /* find changed records */
        /*  write to DB */
        /* disconnect from data-source */
    end method.

end class.