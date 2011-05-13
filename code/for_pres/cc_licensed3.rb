module CCLicensed

  ...

  # Creative Commons share logic
  def share?(option = {})
    attribution = option[:attr]  || false
    commercial  = option[:comml] || false
    derivative  = option[:deriv] || false
    share_alike = option[:sa]    || false

    ...

    # Can't share CC-licensed works commercially, if under comercial license
    if(commercial && %w{Attribution-NonCommercial Attribution-NonCommercial-ShareAlike
                        Attribution-NonCommercial-NoDerives}.include?(@license))
      return false
    end

    # Can't share CC-licensed works remixed with a different license
    # (share_alike == false), if under a share-alike license
    if(derivative && !share_alike &&
       %w{Attribution-ShareAlike 'Attribution-NonCommercial-ShareAlike}.include?(@license))
      return false
    end

    # Fall through to true, if all the above passed
    return true
  end

end
