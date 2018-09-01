/*------------------------------------------------------------------------
    File        : OrderBE
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

class Services.OrderBE: 
    constructor public OrderBE():
    end constructor.
    
    method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams):
        /* calculated fields, whatnot */
    end method.

    method public void Save(input-output dataset-handle phData, input-output dataset-handle phParams):
        /* validations */
    end method.

end class.